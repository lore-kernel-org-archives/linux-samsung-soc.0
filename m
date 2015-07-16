From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [patch v2 2/2] pinctrl: samsung: remove "out of memory" messages
Date: Thu, 16 Jul 2015 10:22:33 +0200
Message-ID: <CACRpkdaKn+vv2Mf=G=YpisokpvQfxGaHMkgA4aGNpL9-zr9Vqg@mail.gmail.com>
References: <20150619085203.GO28762@mwanda>
	<20150622151315.GB14156@mwanda>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <20150622151315.GB14156@mwanda>
Sender: linux-gpio-owner@vger.kernel.org
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Tomasz Figa <tomasz.figa@gmail.com>, Thomas Abraham <thomas.abraham@linaro.org>, Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

On Mon, Jun 22, 2015 at 5:13 PM, Dan Carpenter <dan.carpenter@oracle.com> wrote:

> Checkpatch.pl complains about these:
>
> WARNING: Possible unnecessary 'out of memory' message
>
> The messages use a little extra RAM and they add a few extra lines of
> code.  We're probably never going to hit these out of memory situations
> but if we did then kmalloc() has pretty good error messages built-in.
>
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Patch applied with Krzysztof's review tag.

Yours,
Linus Walleij
