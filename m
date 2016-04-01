From: Joachim Eastwood <manabian@gmail.com>
Subject: Re: [PATCH] ARM: dts: s3c: Fix DTC unit name warnings in S3C2416 and S3C6410
Date: Fri, 1 Apr 2016 16:22:59 +0200
Message-ID: <CAGhQ9VwJVz0riwx=DWY=giaL=Jo6R=HYZg4hm2FQ6X2_g5hi5Q@mail.gmail.com>
References: <1459494710-16269-1-git-send-email-k.kozlowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1459494710-16269-1-git-send-email-k.kozlowski@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Cc: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Kukjin Kim <kgene@kernel.org>, devicetree <devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, linux-samsung-soc@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

On 1 April 2016 at 09:11, Krzysztof Kozlowski <k.kozlowski@samsung.com> wrote:
> Fix following DTC warnings in S3C2416 and S3C6410 boards:
>
> Warning (unit_address_vs_reg): Node /memory has a reg or ranges property, but no unit name
>
> Signed-off-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>
> ---
>  arch/arm/boot/dts/s3c2416-smdk2416.dts | 2 +-
>  arch/arm/boot/dts/s3c6410-mini6410.dts | 2 +-
>  arch/arm/boot/dts/s3c6410-smdk6410.dts | 2 +-
>  3 files changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/arch/arm/boot/dts/s3c2416-smdk2416.dts b/arch/arm/boot/dts/s3c2416-smdk2416.dts
> index f257926c13b7..15f3d1c1bb80 100644
> --- a/arch/arm/boot/dts/s3c2416-smdk2416.dts
> +++ b/arch/arm/boot/dts/s3c2416-smdk2416.dts
> @@ -15,7 +15,7 @@
>         model = "SMDK2416";
>         compatible = "samsung,s3c2416";
>
> -       memory {
> +       memory@30000000 {
>                 reg =  <0x30000000 0x4000000>;
>         };

This change will cause duplicated memory node entries in the DT as
noted by Vladimir Zapolskiy [1]. Same goes for all the other patch
where you make this change.

$ scripts/dtc/dtc -I dtb -O dts arch/arm/boot/dts/s3c2416-smdk2416.dtb
| grep -A2 memory
        memory {
                device_type = "memory";
                reg = <0x0 0x0>;
        };
