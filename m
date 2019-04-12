From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH] ARM: s3c64xx: Tidy up handling of regulator GPIO lookups
Date: Fri, 12 Apr 2019 12:28:24 +0200
Message-ID: <CAJKOXPfiTUhNjJWWTjsiaK5kbpvVEE8v_CjP-H5DaVVvO-mbhw@mail.gmail.com>
References: <20190412071458.23122-1-linus.walleij@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
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
Cc: "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Charles Keepax <ckeepax@opensource.cirrus.com>, linux-arm-kernel@lists.infradead.org, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

On Fri, 12 Apr 2019 at 09:17, Linus Walleij <linus.walleij@linaro.org> wrote:
>
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

Hi,

This was never sent before to linux-samsung-soc, nor to me. I am
properly listed there:
Krzysztof Kozlowski <krzk@kernel.org> (maintainer:ARM/SAMSUNG EXYNOS
ARM ARCHITECTURES)
linux-samsung-soc@vger.kernel.org (moderated list:ARM/SAMSUNG EXYNOS
ARM ARCHITECTURES)

And yes - I am collecting these (mach-exynos, mach-s3c, mach-s5p and
plat-samsung)

I will pick it up.

Best regards,
Krzysztof
