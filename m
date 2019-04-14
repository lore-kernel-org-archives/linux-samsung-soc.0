From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH] ARM: s3c64xx: Tidy up handling of regulator GPIO lookups
Date: Sun, 14 Apr 2019 13:19:53 +0200
Message-ID: <20190414111953.GA5719@kozik-lap>
References: <20190412071458.23122-1-linus.walleij@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <20190412071458.23122-1-linus.walleij@linaro.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-samsung-soc@vger.kernel.org, Charles Keepax <ckeepax@opensource.cirrus.com>, linux-arm-kernel@lists.infradead.org, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

On Fri, Apr 12, 2019 at 09:14:58AM +0200, Linus Walleij wrote:
> From: Charles Keepax <ckeepax@opensource.cirrus.com>
> 
> Rather than unconditionally registering the GPIO lookup table only do so
> for devices that require it.
> 
> Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
> [Fixed up to also handle wm5102 and wm5102 reva]
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
> This modified patch from Charles is sitting in one of
> my regulator branches.
> Krzsystof are you collecting S3C patches?
> The MAINATINERS file seems to be lacking an S3C maintainer
> currently...
> ---
>  arch/arm/mach-s3c64xx/mach-crag6410-module.c | 14 +++++++++++---

Thanks, applied.

Best regards,
Krzysztof
