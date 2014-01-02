From: Tomasz Figa <t.figa@samsung.com>
Subject: Re: [PATCH V4 1/6] clk: exynos-audss: convert to platform device
Date: Thu, 02 Jan 2014 16:20:49 +0100
Message-ID: <1592382.OOUUI06mrc@amdc1227>
References: <1380046016-5811-1-git-send-email-abrestic@chromium.org>
 <20131127184145.16819.44300@quantum> <529BBB9E.40300@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-reply-to: <529BBB9E.40300@samsung.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Kukjin Kim <kgene.kim@samsung.com>, Mike Turquette <mturquette@linaro.org>
Cc: Mark Rutland <mark.rutland@arm.com>, linux-doc@vger.kernel.org, Andrew Bresticker <abrestic@chromium.org>, Doug Anderson <dianders@chromium.org>, Padma Venkat <padma.kvr@gmail.com>, Tushar Behera <tushar.behera@linaro.org>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Russell King <linux@arm.linux.org.uk>, Sachin Kamat <sachin.kamat@linaro.org>, Stephen Warren <swarren@wwwdotorg.org>, Grant Likely <grant.likely@linaro.org>, devicetree@vger.kernel.org, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Rob Herring <rob.herring@calxeda.com>, Sylwester Nawrocki <sylvester.nawrocki@gmail.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Rahul Sharma <rahul.sharma@samsung.com>, Padmavathi Venna <padma.v@samsung.com>, Jiri Kosina <jkosina@suse.cz>, Stephen Boyd <sboyd@codeaurora.org>, linux-kernel@vger
List-Id: linux-samsung-soc@vger.kernel.org

Hi Kukjin, Mike,

On Monday 02 of December 2013 07:43:42 Kukjin Kim wrote:
> On 11/28/13 03:41, Mike Turquette wrote:
> > Quoting Padma Venkat (2013-11-25 22:29:44)
> >> Hi Mike and Kukjin,
> >>
> >> On Tue, Oct 8, 2013 at 10:23 PM, Andrew Bresticker
> >> <abrestic@chromium.org>  wrote:
> >>> Hi Mike and Kukjin,
> >>>
> >>> Any decisions regarding this patchset?  I believe all comments have
> >>> been addressed.
> >>>
> >>> Thanks,
> >>> Andrew
> >>
> >> Any decisions on this patchset. These can be applied directly on
> >> linux-samsung tree.
> >
> > For all of the clk parts:
> >
> > Acked-by: Mike Turquette<mturquette@linaro.org>
> >
> > I'm happy to take them in as part of a pull request.
> >
> OK, Mike, I will take this series into samsung tree and let me send a 
> pull request for your clk tree to avoid useless merge conflicts.

Hmm, I can't find this series in any tree, so I guess it has been lost
in action.

Should I take it through samsung-clk tree with your acks?

Best regards,
Tomasz
