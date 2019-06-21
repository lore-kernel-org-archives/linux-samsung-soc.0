From: =?UTF-8?q?Pawe=C5=82=20Chmiel?= <pawel.mikolaj.chmiel@gmail.com>
Subject: [PATCH v4 0/2] power: supply: max8998-charger: Device Tree support
Date: Fri, 21 Jun 2019 13:56:00 +0200
Message-ID: <20190621115602.17559-1-pawel.mikolaj.chmiel@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: sre@kernel.org
Cc: lee.jones@linaro.org, robh+dt@kernel.org, mark.rutland@arm.com, linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org, =?UTF-8?q?Pawe=C5=82=20Chmiel?= <pawel.mikolaj.chmiel@gmail.com>
List-Id: linux-samsung-soc@vger.kernel.org

This patch series compose of 2 patches.

First patch, updates max8998 charger driver, so it's possible to parse
devicetree for configuration.

Second patch, updates max8998 documentation, so it includes new node 
and properties, needed for charger.

Patches has been tested on, Samsung Galaxy S (i9000) phone.

Changes from v3:
  - Property prefix should be maxim, not max8998
  - Changed property name to more meaning full
  - Describe what End of Charge in percent means

Changes from v2:
  - Make charge-restart-level-microvolt and charge-timeout-hours
    properties optional. If they're not present, assume they're disabled.

Changes from v1:
  - Removed unneeded Fixes tag
  - Correct description of all charger values
  - Added missing property unit for charger properties
  - Removed already applied patch

Paweł Chmiel (2):
  power: supply: max8998-charger: Parse device tree for required data.
  dt-bindings: mfd: max8998: Add charger subnode binding

 .../devicetree/bindings/mfd/max8998.txt       | 26 ++++++++
 drivers/power/supply/max8998_charger.c        | 60 +++++++++++++++++++
 2 files changed, 86 insertions(+)

-- 
2.17.1
