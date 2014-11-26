From: Kukjin Kim <kgene@kernel.org>
Subject: Re: [PATCH v6 1/2] i2c: s3c2410: add Sysreg phandle to i2c device
 nodes
Date: Thu, 27 Nov 2014 03:43:04 +0900
Message-ID: <54761F38.4030102@kernel.org>
References: <1416818867-29156-1-git-send-email-pankaj.dubey@samsung.com> <1416818867-29156-2-git-send-email-pankaj.dubey@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <1416818867-29156-2-git-send-email-pankaj.dubey@samsung.com>
Sender: linux-doc-owner@vger.kernel.org
To: Pankaj Dubey <pankaj.dubey@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, kgene.kim@samsung.com, tomasz.figa@gmail.com, thomas.ab@samsung.com, Rob Herring <robh+dt@kernel.org>, Randy Dunlap <rdunlap@infradead.org>, Russell King <linux@arm.linux.org.uk>, devicetree@vger.kernel.org, linux-doc@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

On 11/24/14 17:47, Pankaj Dubey wrote:
> This patch adds syscon based phandle to i2c device nodes of exynos5250
> and exynos5420. These phandles will be used to save restore i2c sysreg
> configuration register during s2r from i2c driver.
> 
> CC: Rob Herring <robh+dt@kernel.org>
> CC: Randy Dunlap <rdunlap@infradead.org>
> CC: Russell King <linux@arm.linux.org.uk>
> CC: devicetree@vger.kernel.org
> CC: linux-doc@vger.kernel.org
> Signed-off-by: Pankaj Dubey <pankaj.dubey@samsung.com>

Applied with change the subject 'ARM: dts: add sysreg phandle to...'

BTW I'm holding on 2nd because conflicts between pm update and cleanup
branches in my tree...

- Kukjin

> ---
>  .../devicetree/bindings/i2c/i2c-s3c2410.txt        |    1 +
>  arch/arm/boot/dts/exynos5250.dtsi                  |    4 ++++
>  arch/arm/boot/dts/exynos5420.dtsi                  |    4 ++++
>  3 files changed, 9 insertions(+)
