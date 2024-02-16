<?php

namespace vendor\isenselabs\Squareup\Compatibility;

use \Model as OpenCartModel;

class Model extends OpenCartModel {
    use Traits\Loader;
    use Traits\Mail;
}