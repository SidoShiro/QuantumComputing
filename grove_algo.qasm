OPENQASM 2.0;
include "qelib1.inc";

gate tricontrol qb0, qb1, qb2, qb3  {
  // Migth have an error here : WARNING  
  mcz qb0, qb1, qb2;
  z qb3;
}

gate hstar qb0, qb1, qb2, qb3  {
  h qb0;
  h qb1;
  h qb2;
  h qb3;
}

gate xstar qb0, qb1, qb2, qb3  {
  x qb0;
  x qb1;
  x qb2;
  x qb3;
}

gate oracle qb0, qb1, qb2, qb3  {
  // Migth have an error here : WARNING
  x qb0;
  x qb1;
  x qb3;
  tricontrol qb0, qb1, qb2, qb3;
  x qb0;
  x qb1;
  x qb2;
}

gate ampli qb0, qb1, qb2, qb3  {
  hstar qb0, qb1, qb2, qb3;
  xstar qb0, qb1, qb2, qb3;
  tricontrol qb0, qb1, qb2, qb3;
  xstar qb0, qb1, qb2, qb3;
  hstar qb0, qb1, qb2, qb3;
}

qreg q[5];
creg c[5];

hstar q[0],q[1],q[2],q[3];
oracle q[0],q[1],q[2],q[3];
ampli q[0],q[1],q[2],q[3];
oracle q[0],q[1],q[2],q[3];
ampli q[0],q[1],q[2],q[3];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
measure q[3] -> c[3];
