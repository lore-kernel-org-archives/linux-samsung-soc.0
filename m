From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH 1/2 RESEND] gpio: samsung: Remove OF support for s3c24xx
Date: Wed, 05 Jun 2013 20:46:55 +0900
Message-ID: <08e201ce61e2$60c1a650$2244f2f0$%kim@samsung.com>
References: <1370088225-5187-1-git-send-email-sylvester.nawrocki@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <1370088225-5187-1-git-send-email-sylvester.nawrocki@gmail.com>
Content-language: ko
Sender: linux-kernel-owner@vger.kernel.org
To: 'Sylwester Nawrocki' <sylvester.nawrocki@gmail.com>, linus.walleij@linaro.org
Cc: linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 'Sylwester Nawrocki' <s.nawrocki@samsung.com>, =?UTF-8?Q?'Heiko_St=C3=BCbner'?= <heiko@sntech.de>, 'Kyungmin Park' <kyungmin.park@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

Sylwester Nawrocki wrote:
>=20
> From: Sylwester Nawrocki <s.nawrocki@samsung.com>
>=20
> There is no users of this code and there is already a pinctrl
> driver written for s3c24xx which is going to be used on any
> s3c24xx DT platforms. Hence this has been effectively a dead
> code in mainline.
>=20
> This reverts commit 172c6a13653ac8cd6a231293b87c93821e90c1d6
> gpio: samsung: add devicetree init for s3c24xx arches
>=20
> Cc: Heiko St=C3=BCbner <heiko@sntech.de>
> Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
> Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
> Acked-by: Heiko Stuebner <heiko@sntech.de>
> Acked-by: Linus Walleij <linus.walleij@linaro.org>
> ---
> This patch was supposed to be merged through the Samsung tree
> (https://patchwork.kernel.org/patch/2450291) but it seem to
> have slipped through the cracks.
>=20
Oh, OK. Let me apply into the samsung tree.

Thanks for your gentle reminder.

- Kukjin
