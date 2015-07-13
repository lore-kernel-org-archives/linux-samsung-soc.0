From: Javier Martinez Canillas <javier@osg.samsung.com>
Subject: [PATCH 0/3] mfd: Improve DT binding docs for max77686 and max77802
Date: Mon, 13 Jul 2015 09:42:25 +0200
Message-ID: <1436773348-15316-1-git-send-email-javier@osg.samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Lee Jones <lee.jones@linaro.org>
Cc: devicetree@vger.kernel.org, Krzysztof Kozlowski <k.kozlowski@samsung.com>, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, Javier Martinez Canillas <javier@osg.samsung.com>, Mark Brown <broonie@kernel.org>, linux-arm-kernel@lists.infradead.org
List-Id: linux-samsung-soc@vger.kernel.org

Hello Lee,

This series contains some improvements for the Device Tree bindings of
the Maxim MAX77686 and MAX77802 multi-function devices.

Patch #1 changes the max77686 binding to not suggest using a deprecated
property of the regulator DT binding.

Patch #2 adds a DT binding for the mfd portion of the max77802 that was
missing.

Patch #3 moves the regulator portion of the max77686 to the regulator's
DT binding sub-directory since it is a better fit for this information.
This third patch needs an ack from the regulator sub-system maintainer.


Javier Martinez Canillas (3):
  mfd: max77686: Don't suggest in binding to use a deprecated property
  mfd: Add DT binding for Maxim MAX77802 IC
  mfd: max77686: Split out regulator part from the DT binding

 Documentation/devicetree/bindings/mfd/max77686.txt | 61 +------------------
 Documentation/devicetree/bindings/mfd/max77802.txt | 26 ++++++++
 .../devicetree/bindings/regulator/max77686.txt     | 71 ++++++++++++++++++++++
 3 files changed, 100 insertions(+), 58 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/mfd/max77802.txt
 create mode 100644 Documentation/devicetree/bindings/regulator/max77686.txt

-- 
2.4.3
