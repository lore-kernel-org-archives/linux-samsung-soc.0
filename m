From: Mike Turquette <mturquette@linaro.org>
Subject: Re: [PATCH v7 00/11] Add generic set_rate clk_ops for PLL35xx and
 PLL36xx for samsung SoCs
Date: Mon, 24 Jun 2013 12:02:27 -0700
Message-ID: <20130624190227.20448.68120@quantum>
References: <1370943076-13461-1-git-send-email-yadi.brar@samsung.com>
 <CAKew6eUOy4=D08v_iq7CTRY5gvt37VAN7Z7WOr2Yt25znDJb2g@mail.gmail.com>
 <CAGm_ybiVZOPBJJ0bYX33wafn1So6aqSAnk7myXZ+Z+RfLBeBQw@mail.gmail.com>
 <1524664.UCV47tfIRU@flatron> <20130621163143.9136.28807@quantum>
 <51C85F8F.9050501@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <51C85F8F.9050501@samsung.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
Cc: Vikas Sajjan <sajjan.linux@gmail.com>, Yadwinder Singh Brar <yadi.brar@samsung.com>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Andrew Bresticker <abrestic@chromium.org>, Tomasz Figa <t.figa@samsung.com>, Tomasz Figa <tomasz.figa@gmail.com>, Doug Anderson <dianders@chromium.org>, Kukjin Kim <kgene.kim@samsung.com>, Thomas Abraham <thomas.abraham@linaro.org>, Vikas Sajjan <vikas.sajjan@linaro.org>, linux-arm-kernel@lists.infradead.org
List-Id: linux-samsung-soc@vger.kernel.org

Quoting Kukjin Kim (2013-06-24 08:02:39)
> On 06/22/13 01:31, Mike Turquette wrote:
> >
> > Acked-by: Mike Turquette<mturquette@linaro.org>
> >
> > Or I can take this through the clk tree. Either way is fine.
> >
> Mike, please go ahead taking this series into the clk tree for 3.11.

Actually it might be better for you to take it. Patch #5 relies on
drivers/clk/samsung/clk-exynos5420.c which only exists in the samsung
tree.  It was introduced by commit 1609027f, "clk: exynos5420: register
clocks using common clock framework".

And these patches need to be applied with some fuzz to the clk tree due
to other changes which are not in my tree and only present in yours.

The best two options are either for you to take this series or it can be
rebased on top of clk-next, after which I'll apply it.

Regards,
Mike

> 
> Thanks,
> - Kukjin
