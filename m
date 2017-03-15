From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH -next v2] pinctrl: samsung: Fix return value check in
 samsung_pinctrl_get_soc_data()
Date: Wed, 15 Mar 2017 14:45:20 +0100
Message-ID: <CACRpkdbY9SJhoqmMQBSc169SgVagcrPb9DaYnLXT0atLc1pH1Q@mail.gmail.com>
References: <20170125140321.23911-1-weiyj.lk@gmail.com>
 <20170205155849.4362-1-weiyj.lk@gmail.com>
 <CGME20170213145008epcas3p119bdd6f76468a00fb8d796308ad37698@epcas3p1.samsung.com>
 <CACRpkda0BYLNpPFwpNaEMdeyx61KDUQz_6Y=FQj340pViFjVVQ@mail.gmail.com>
 <c4dd122b-0312-fcca-08e2-4d4586949a88@samsung.com>
 <CACRpkda1tALy3rmk7FebnR3Xg4WOuUc0Gv1xAmxkd+RLhJ_1VQ@mail.gmail.com>
 <0eb09039-17c4-5c00-0501-812d4de1ab4a@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <0eb09039-17c4-5c00-0501-812d4de1ab4a@samsung.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Andrzej Hajda <a.hajda@samsung.com>
Cc: linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Wei Yongjun <weiyj.lk@gmail.com>, =?UTF-8?B?7LWc7LCs7Jqw?= <cw00.choi@samsung.com>, =?UTF-8?B?6rmA7Iq57Jqw?= <sw0312.kim@samsung.com>, Tomasz Figa <tomasz.figa@gmail.com>, Krzysztof Kozlowski <krzk@kernel.org>, =?UTF-8?B?64yA7J246riw?= <inki.dae@samsung.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Wei Yongjun <weiyongjun1@huawei.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Marek Szyprowski <m.szyprowski@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

On Tue, Mar 14, 2017 at 11:44 AM, Andrzej Hajda <a.hajda@samsung.com> wrote:

> I have posted proper fix some times ago[1], no need to revert.
>
> [1]: https://www.spinics.net/lists/linux-samsung-soc/msg58395.html

OK fixed that now.

Unreverted the revert, applied your patch.

Yours,
Linus Walleij
