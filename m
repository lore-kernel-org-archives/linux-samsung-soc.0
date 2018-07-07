From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH v4 4/5] dt-bindings: samsung: Document bindings for
 Samsung aries boards
Date: Sat, 7 Jul 2018 12:33:45 +0200
Message-ID: <20180707103345.vzx2x3sqmfcet3fw@kozik-lap>
References: <1530958183-10956-1-git-send-email-pawel.mikolaj.chmiel@gmail.com>
 <1530958183-10956-5-git-send-email-pawel.mikolaj.chmiel@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1530958183-10956-5-git-send-email-pawel.mikolaj.chmiel@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: =?utf-8?B?UGF3ZcWC?= Chmiel <pawel.mikolaj.chmiel@gmail.com>
Cc: kgene@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, linux@armlinux.org.uk, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, xc-racer2@live.ca
List-Id: linux-samsung-soc@vger.kernel.org

On Sat, Jul 07, 2018 at 12:09:42PM +0200, Paweł Chmiel wrote:
> Document the binding for Samsung Galaxy S (i9000) phone
> and whole Samsung Aries devices family (based on S5PV210).
> 
> Also because this is first not Exynos-based devices, document this information
> at beginning of file.
> 
> Signed-off-by: Paweł Chmiel <pawel.mikolaj.chmiel@gmail.com>
> Reviewed-by: Rob Herring <robh@kernel.org>
> --
> Changes from v2:
>   - Squashed with patch which was documenting existence
>     of non Exynos-based boards
>   - Added reviewed-by
> 
> Changes from v1:
>   - Added missing commit msg.
> --
> ---
>  Documentation/devicetree/bindings/arm/samsung/samsung-boards.txt | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 

Thanks, applied.

Best regards,
Krzysztof
