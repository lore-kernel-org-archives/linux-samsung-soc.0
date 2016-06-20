From: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Subject: Re: [PATCH 2/3] clk: samsung: cpu: prepare for adding Exynos5433 CPU
 clocks
Date: Mon, 20 Jun 2016 15:54:53 +0200
Message-ID: <5297672.nIMnaEh2jc@amdc1976>
References: <1464095957-25851-1-git-send-email-b.zolnierkie@samsung.com>
 <1464095957-25851-3-git-send-email-b.zolnierkie@samsung.com>
 <CA+Ln22FwQ_e5OHg_8WHEWGER=X8g_Yq+NpVLONgb0ZAShJLjzA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-reply-to: <CA+Ln22FwQ_e5OHg_8WHEWGER=X8g_Yq+NpVLONgb0ZAShJLjzA@mail.gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Tomasz Figa <tomasz.figa@gmail.com>
Cc: Krzysztof Kozlowski <k.kozlowski@samsung.com>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, linux-kernel <linux-kernel@vger.kernel.org>, Kukjin Kim <kgene@kernel.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, linux-clk@vger.kernel.org, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
List-Id: linux-samsung-soc@vger.kernel.org


On Saturday, June 18, 2016 11:53:36 PM Tomasz Figa wrote:
> Hi Bart,

Hi Tomek,

> 2016-05-24 22:19 GMT+09:00 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>:
> > Exynos5433 uses different register layout for CPU clock registers
> > than earlier SoCs so add new code for handling this layout.  Also
> > add new CLK_CPU_HAS_E5433_REGS_LAYOUT flag to request using it.
> 
> Have you considered abstracting this? Comparing existing code with

Yes, I have considered abstracting this but I've decided that there is
sufficient number of differences to justify adding new code.

> newly added one, the differences don't really seem to be that huge and
> it looks like there is more common code than different, except maybe
> some numeric constants that could be put into a struct.

It is not only that, HPM clock sourcing checking would also need to be
abstracted somehow.  Anyway there is not a lot of new code and it so
much easier to follow by not being shared that I would prefer to keep
it that way.

Best regards,
--
Bartlomiej Zolnierkiewicz
Samsung R&D Institute Poland
Samsung Electronics
