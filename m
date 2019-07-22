From: Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [PATCH 0/4] rtc: convert subsystem to i2c_new_dummy_device()
Date: Mon, 22 Jul 2019 19:26:14 +0200
Message-ID: <20190722172618.4061-1-wsa+renesas@sang-engineering.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-i2c@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>, linux-kernel@vger.kernel.org, linux-rtc@vger.kernel.org, linux-samsung-soc@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

This series is part of a tree-wide movement to replace the I2C API call
'i2c_new_dummy' which returns NULL with its new counterpart returning an
ERRPTR.

The series was generated with coccinelle (audited afterwards, of course) and
build tested by me and by buildbot. No tests on HW have been performed.

The branch is based on v5.3-rc1. A branch (with some more stuff included) can
be found here:

git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git renesas/i2c/new_dummy

Some drivers still need to be manually converted. Patches for those will be
sent out individually.


Wolfram Sang (4):
  rtc: isl12026: convert to i2c_new_dummy_device
  rtc: max77686: convert to i2c_new_dummy_device
  rtc: s35390a: convert to i2c_new_dummy_device
  rtc: s5m: convert to i2c_new_dummy_device

 drivers/rtc/rtc-isl12026.c | 6 +++---
 drivers/rtc/rtc-max77686.c | 6 +++---
 drivers/rtc/rtc-s35390a.c  | 6 +++---
 drivers/rtc/rtc-s5m.c      | 6 +++---
 4 files changed, 12 insertions(+), 12 deletions(-)

-- 
2.20.1
