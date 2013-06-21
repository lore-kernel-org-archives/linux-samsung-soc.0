From: Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 0/5] clk/exynos5420: add clocks for hdmi subsystem
Date: Fri, 21 Jun 2013 09:43:03 -0700
Message-ID: <20130621164303.9136.5127@quantum>
References: <1371565998-3642-1-git-send-email-rahul.sharma@samsung.com>
 <CAPdUM4MtBXMaZDDRT1aKsS=HzwjpbyMY85oRLMbk-KvJCU1hag@mail.gmail.com>
 <51C1B9AD.8060804@samsung.com> <20130621043252.9136.66418@quantum>
 <CAPdUM4NxCKtKrZg1RYD0=83jDYt9Nzd3paYL53ZL9tt2zfJy7A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <CAPdUM4NxCKtKrZg1RYD0=83jDYt9Nzd3paYL53ZL9tt2zfJy7A-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss/>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: "devicetree-discuss"
 <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
To: Rahul Sharma <r.sh.open-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, sw0312.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, joshi-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, inki.dae-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, Kukjin Kim <kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Rahul Sharma <rahul.sharma-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
List-Id: linux-samsung-soc@vger.kernel.org

Quoting Rahul Sharma (2013-06-20 21:47:35)
> On Fri, Jun 21, 2013 at 10:02 AM, Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> wrote:
> > Quoting Kukjin Kim (2013-06-19 07:01:17)
> >> On 06/19/13 13:04, Rahul Sharma wrote:
> >> > + mike
> >> >
> >> Mike, I'm waiting for your reply on this. If you're OK, let me take this
> >> series on top of exynos5420 stuff in samsung tree.
> >>
> >> Of course, if any concerns, please let me know.
> >
> > I never got these patches.  I'm not subscribed to devicetree-devel or
> > linux-samsung so I only got two replies to patch #0, but none of the
> > code. Can you or Rajul resend?
> >
> 
> Sure mike.

Acked-by: Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>

Regards,
Mike

> 
> > Thanks,
> > Mike
> >
> >>
> >> Thanks,
> >> - Kukjin
> >>
> >> > On Tue, Jun 18, 2013 at 8:03 PM, Rahul Sharma<rahul.sharma-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>  wrote:
> >> >> Add clock changes for hdmi subsystem for exynos5250 SoC. These
> >> >> include addition of new clocks like mout_hdmi and smmu_tv, associating
> >> >> ID to clk_hdmiphy and some essential corrections.
> >> >>
> >> >> This set is based on kukjin's for-next branch at
> >> >> http://git.kernel.org/cgit/linux/kernel/git/kgene/linux-samsung.git.
> >> >>
> >> >> This set dependents on the following patches which add support for Exynos5420
> >> >> http://www.mail-archive.com/linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org/msg19264.html
> >> >>
> >> >> Rahul Sharma (5):
> >> >>    clk/exynos5420: add sclk_hdmiphy to the list of special clocks
> >> >>    clk/exynos5420: add gate clock for tv sysmmu
> >> >>    clk/exynos5420: fix the order of parents of hdmi mux
> >> >>    clk/exynos5420: add hdmi mux to change parents in hdmi driver
> >> >>    clk/exynos5420: assign sclk_pixel id to pixel clock divider
> >> >>
> >> >>   .../devicetree/bindings/clock/exynos5420-clock.txt   |    7 +++++++
> >> >>   drivers/clk/samsung/clk-exynos5420.c                 |   18 +++++++++++-------
> >> >>   2 files changed, 18 insertions(+), 7 deletions(-)
> >> >>
> >> >> --
> >> >> 1.7.10.4
