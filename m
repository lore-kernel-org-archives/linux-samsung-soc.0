From: Karol Lewandowski <k.lewandowsk-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: [PATCH 0/2] i2c-s3c2410: Updates for exynos4210 and DT-based systems
Date: Fri, 09 Mar 2012 18:04:44 +0100
Message-ID: <1331312686-2077-1-git-send-email-k.lewandowsk@samsung.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN
Content-Transfer-Encoding: 7BIT
Return-path: <linux-i2c-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-i2c-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: ben-linux-elnMNo+KYs3YtjvyW6yDsg@public.gmane.org
Cc: thomas.abraham-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, m.szyprowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, t.stanislaws-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, Karol Lewandowski <k.lewandowsk-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
List-Id: linux-samsung-soc@vger.kernel.org

Hi,

This patchset reworks i2c-s3c2410 driver a bit to better handle
device tree-enabled platforms and adds two quirks required by
exynos4210-specific I2C controller used by s5p-hdmi driver.

This patchset is based on "i2c-bjdooks/for-34/i2c/i2c-samsung" branch
taken from:

  git://git.fluff.org/bjdooks/linux.git

Karol Lewandowski (1):
  i2c-s3c2410: Rework device type handling

Tomasz Stanislawski (1):
  i2c-s3c2410: Add HDMIPHY quirk for S3C2440

 .../devicetree/bindings/i2c/samsung-i2c.txt        |   10 ++-
 drivers/i2c/busses/i2c-s3c2410.c                   |   90 ++++++++++++--------
 2 files changed, 62 insertions(+), 38 deletions(-)

-- 
1.7.9
