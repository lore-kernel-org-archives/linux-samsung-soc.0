From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH v3 0/9] Initial support for Samsung Galaxy S and Galaxy S
 4G
Date: Sat, 7 Jul 2018 10:52:22 +0200
Message-ID: <20180707085222.6z6wihfvg7stfuya@kozik-lap>
References: <1530901970-14972-1-git-send-email-pawel.mikolaj.chmiel@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1530901970-14972-1-git-send-email-pawel.mikolaj.chmiel@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: =?utf-8?B?UGF3ZcWC?= Chmiel <pawel.mikolaj.chmiel@gmail.com>
Cc: kgene@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, linux@armlinux.org.uk, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, xc-racer2@live.ca
List-Id: linux-samsung-soc@vger.kernel.org

On Fri, Jul 06, 2018 at 08:32:41PM +0200, Paweł Chmiel wrote:
> This patch series adds support for Samsung Galaxy S and Galaxy S 4G.
> Both are commercial phone based on Aries family.
> 
> Changes from v2:
>   - Restored pinctrl nodes order
>   - Correct order of nodes in aries dtsi file
>   - Added Reviewed-by to one of patches
>   - Added Acked-by to one of patches
>   - Squashed two patches updating samsung-boards documentation 

I applied first DTS patch and last defconfig.  You can resend only the
DTS patches after fixing dtc warnings.  Then I'll apply them with the
bindings change.

Best regards,
Krzysztof
