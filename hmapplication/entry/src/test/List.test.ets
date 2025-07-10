import BottomNavBarTest from './BottomNavBar.test'
import localUnitTest from './LocalUnit.test';

export default function testsuite() {
  localUnitTest();
  BottomNavBarTest()
}