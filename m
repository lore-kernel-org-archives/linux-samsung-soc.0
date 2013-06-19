From: Rahul Sharma <r.sh.open-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 0/5] clk/exynos5420: add clocks for hdmi subsystem
Date: Wed, 19 Jun 2013 09:34:39 +0530
Message-ID: <CAPdUM4MtBXMaZDDRT1aKsS=HzwjpbyMY85oRLMbk-KvJCU1hag@mail.gmail.com>
References: <1371565998-3642-1-git-send-email-rahul.sharma@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1371565998-3642-1-git-send-email-rahul.sharma-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
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
To: linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Cc: kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, sw0312.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, joshi-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, inki.dae-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, Rahul Sharma <rahul.sharma-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
List-Id: linux-samsung-soc@vger.kernel.org

+ mike

On Tue, Jun 18, 2013 at 8:03 PM, Rahul Sharma <rahul.sharma-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org> wrote:
> Add clock changes for hdmi subsystem for exynos5250 SoC. These
> include addition of new clocks like mout_hdmi and smmu_tv, associating
> ID to clk_hdmiphy and some essential corrections.
>
> This set is based on kukjin's for-next branch at
> http://git.kernel.org/cgit/linux/kernel/git/kgene/linux-samsung.git.
>
> This set dependents on the following patches which add support for Exynos5420
> http://www.mail-archive.com/linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org/msg19264.html
>
> Rahul Sharma (5):
>   clk/exynos5420: add sclk_hdmiphy to the list of special clocks
>   clk/exynos5420: add gate clock for tv sysmmu
>   clk/exynos5420: fix the order of parents of hdmi mux
>   clk/exynos5420: add hdmi mux to change parents in hdmi driver
>   clk/exynos5420: assign sclk_pixel id to pixel clock divider
>
>  .../devicetree/bindings/clock/exynos5420-clock.txt   |    7 +++++++
>  drivers/clk/samsung/clk-exynos5420.c                 |   18 +++++++++++-------
>  2 files changed, 18 insertions(+), 7 deletions(-)
>
> --
> 1.7.10.4
>
