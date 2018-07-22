From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCHv2] ARM: dts: exynos5: add missing interrupts for pwm node
Date: Sun, 22 Jul 2018 17:08:12 +0200
Message-ID: <20180722150812.dmk2qmhp3jwejt3b@kozik-lap>
References: <1531918767-7177-1-git-send-email-linux.amoon@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1531918767-7177-1-git-send-email-linux.amoon@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Anand Moon <linux.amoon@gmail.com>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Kukjin Kim <kgene@kernel.org>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

On Wed, Jul 18, 2018 at 12:59:27PM +0000, Anand Moon wrote:
> Add missing GIC interrupts property for pwm nodes.
> 
> Signed-off-by: Anand Moon <linux.amoon@gmail.com>
> ---
> Fixed the patch indentation issue with all tabs.
> sorry checkpatch could not figure out the error.
> ---
>  arch/arm/boot/dts/exynos5.dtsi | 5 +++++
>  1 file changed, 5 insertions(+)

Thanks, applied with fixed subsystem prefix in subject and indentation.

Best regards,
Krzysztof
