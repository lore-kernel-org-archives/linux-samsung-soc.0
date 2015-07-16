From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [patch v2 1/2] pinctrl: samsung: don't truncate the last char
Date: Thu, 16 Jul 2015 10:21:02 +0200
Message-ID: <CACRpkdbG8Qm6tyrNqJJBb=cg9jR=CZsdhTksn_7XQXHGf5fNng@mail.gmail.com>
References: <20150619085203.GO28762@mwanda>
	<20150622151223.GA14156@mwanda>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <20150622151223.GA14156@mwanda>
Sender: linux-gpio-owner@vger.kernel.org
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Tomasz Figa <tomasz.figa@gmail.com>, Thomas Abraham <thomas.abraham@linaro.org>, Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

On Mon, Jun 22, 2015 at 5:12 PM, Dan Carpenter <dan.carpenter@oracle.com> wrote:

> We were allocating enough space because sizeof("-grp") and
> sizeof("-mux") are both equal to 5 but in the snprintf() we only allowed
> for 4 characters so the last 'p' and 'x' characters were truncated.
>
> The allocate and sprintf can be done in one step with the kasprintf().
>
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Patch applied with Krzysztof's review tag.

Yours,
Linus Walleij
