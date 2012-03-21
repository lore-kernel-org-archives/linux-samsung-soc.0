From: Karol Lewandowski <k.lewandowsk-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: [PATCH v3 0/3] i2c-s3c2410: Updates for exynos4210 and DT-based systems
Date: Wed, 21 Mar 2012 20:11:50 +0100
Message-ID: <1332357113-2973-1-git-send-email-k.lewandowsk@samsung.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN
Content-Transfer-Encoding: 7BIT
Return-path: <linux-i2c-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-i2c-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: w.sang-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org
Cc: ben-linux-elnMNo+KYs3YtjvyW6yDsg@public.gmane.org, m.szyprowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, thomas.abraham-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, t.stanislaws-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, kyungmin.park-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org, Karol Lewandowski <k.lewandowsk-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
List-Id: linux-samsung-soc@vger.kernel.org

Changes since v2:
 - Merge device type and flags into flat bitmask named quirks -
   Consequently, treat s3c24xx as baseline hardware platform and
   support all hw variations via quirks [Suggested by Mark Brown]

Changes since v1:
 - Move unrelated code fragment to separate patch (of_match_ptr())
   [Suggested by Thomas Abracham]
 - Move device-type handling to separate function and rework its
   internals a bit [likewise]

This patchset reworks i2c-s3c2410 driver a bit to better handle
device tree-enabled platforms and adds two quirks required by
exynos4210-specific I2C controller used by s5p-hdmi driver.

This patchset is based on "i2c-bjdooks/for-34/i2c/i2c-samsung" branch
taken from:

  git://git.fluff.org/bjdooks/linux.git

Karol Lewandowski (3):
  i2c-s3c2410: Drop unused define
  i2c-s3c2410: Rework device type handling
  i2c-s3c2410: Add HDMIPHY quirk for S3C2440

 .../devicetree/bindings/i2c/samsung-i2c.txt        |   11 ++-
 drivers/i2c/busses/i2c-s3c2410.c                   |   86 +++++++++++++------
 2 files changed, 68 insertions(+), 29 deletions(-)

-- 
1.7.9
