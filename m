From: Stuart Menefy <stuart.menefy@mathembedded.com>
Subject: [PATCH v3 0/2] mfd: sec: Add support for the RTC on S2MPA01
Date: Wed, 13 Feb 2019 22:24:00 +0000
Message-ID: <20190213222402.20541-1-stuart.menefy@mathembedded.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Sangbeom Kim <sbkim73@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Lee Jones <lee.jones@linaro.org>, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org
Cc: Stuart Menefy <stuart.menefy@mathembedded.com>
List-Id: linux-samsung-soc@vger.kernel.org

Add the RTC on the S2MPA01. As this is appears to be identical to the
RTC on the S2MPS14 we can use the existing code.

Before we can do that however tidy up the existing code as requested by
Lee:
https://lore.kernel.org/lkml/20190213072458.GB1863@dell/

Changes since v2:
 - Add patch tidying up existing one element structure initialisation
 - Rebase patch 2/2

Changes since v1:
 - Remove the duplicated code and simply declare the RTC to be the same
   as that on the S2MPS14.

Stuart Menefy (2):
  mfd: sec: Put one element structure initialisation on one line
  mfd: sec: Add support for the RTC on S2MPA01

 drivers/mfd/sec-core.c | 59 +++++++++++++++++---------------------------------
 drivers/mfd/sec-irq.c  |  3 +++
 2 files changed, 23 insertions(+), 39 deletions(-)

-- 
2.13.6
