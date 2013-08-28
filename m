From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [patch] pinctrl: s3c24xx: off by one in s3c24xx_eint_init()
Date: Wed, 28 Aug 2013 14:45:04 +0200
Message-ID: <CACRpkdYtZndvqZgsuqLAieut3aMfF1hfwiWaWWjZccctfj66uA@mail.gmail.com>
References: <20130826233217.GA17061@elgon.mountain>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <kernel-janitors-owner@vger.kernel.org>
In-Reply-To: <20130826233217.GA17061@elgon.mountain>
Sender: kernel-janitors-owner@vger.kernel.org
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Tomasz Figa <t.figa@samsung.com>, Thomas Abraham <thomas.abraham@linaro.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, kernel-janitors@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

On Tue, Aug 27, 2013 at 3:11 AM, Dan Carpenter <dan.carpenter@oracle.com> wrote:

> If "irq == NUM_EINT" then it writes one space beyond the end of the
> eint_data->domains[] array.
>
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Patch applied with Heiko's ACK.

Yours,
Linus Walleij
