module Lib where

import System.IO (stdout)
import qualified CPython as Py
import qualified CPython.Protocols.Object as Py
import qualified CPython.Types as Py
import qualified CPython.Types.Module as Py
import qualified Data.Text as T

pyLoadTF = do
    Py.initialize
    tf <- Py.importModule . T.pack $ "tensorflow"
    return tf

pyPrint :: String -> IO ()
pyPrint s = do
    Py.initialize
    pyString <- Py.toUnicode . T.pack $ s
    Py.print pyString stdout

someFunc :: IO ()
someFunc = putStrLn "someFunc"

