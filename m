From: Kukjin Kim <kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: RE: [PATCH 0/2] usb: exynos: Fix compatible strings used for device
Date: Mon, 21 Jan 2013 21:35:41 -0800
Message-ID: <054601cdf862$534a8ad0$f9dfa070$@samsung.com>
References: <1355410348-5129-1-git-send-email-gautam.vivek@samsung.com>
 <20121215072014.2E05E3E0AE3@localhost>
 <CAFp+6iHaYpinaq8K7rf1GxOJoap6Rd8kGcJn4UmHU28BjTCAsA@mail.gmail.com>
 <CAFp+6iFVSi_pg39YyeEbAgwDsU4kun7u0g8z3u3dVMP4oLpavQ@mail.gmail.com>
 <CAD=FV=WtsfDr=W7TB5BYW087FqXyxXCb0xVfGha6_F65cPCE9A@mail.gmail.com>
 <016901cde163$6be034c0$43a09e40$@samsung.com>
 <CAFp+6iGq32UV3mZ=QYVizJGQEark0Qztu7m4jy3DvG431ajV1w@mail.gmail.com>
 <50DB811A.8010408@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-reply-to: <50DB811A.8010408-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Content-language: en-us
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
To: 'Sylwester Nawrocki' <sylvester.nawrocki-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, 'Vivek Gautam' <gautamvivek1987-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: jg1.han-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, balbi-l0cyMroinI0@public.gmane.org, 'Rob Herring' <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, cpgs-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, 'Alan Stern' <stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org>, 'Vivek Gautam' <gautam.vivek-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
List-Id: linux-samsung-soc@vger.kernel.org

Sylwester Nawrocki wrote:
> 
> On 12/24/2012 09:13 AM, Vivek Gautam wrote:
> >>>> These two changes look good to me.  For both of them:
> >>>>
> >>>> Reviewed-by: Doug Anderson<dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
> >>>
> >>> Well, I have another idea. Yes, I know, specific chip name should be
used.
> >> But
> >>> you know the specific chip name in compatible can cause another
> confusion
> >>> on other SoC which has same IP. So I think, we need to consider to use
> >>> common name or any specific name not chip in compatible for IP/driver
> like
> >>> following?
> >>>
> >>> -     { .compatible = "samsung,exynos-dwc3" },
> >>> +     { .compatible = "samsung,synopsis-dwc3" },
> >>>
> >>> Or if any version or something, how about following?
> >>>
> >>> +     { .compatible = "samsung,dwc-v3" },
> >>>
> > Well, yes the newer SoCs with same IP using the chip name can cause some
> > confusion, but won't it be fine that -
> > "Newer parts using the same core can claim compatibility by
> > including the older string in the compatible list" - as quoted by Grant
Likely
> >
> > Or, can we try another option, using multiple compatible strings for
> > SoC specific
> > in of_match_table, so that we don't create any confusion by using same
> > compatible for newer SoCs also. Like,
> >
> > -     { .compatible = "samsung,exynos-dwc3" },
> > +     { .compatible = "samsung,exynos5250-dwc3" },
> > +     { .compatible =<new SoC using same IP>  },
> 
> Yes, why not just use an SoC name where given IP first appeared ? I
believe
> IP revision numbers are not always well documented. Also when an IP is
> instantiated multiple times in specific SoC, its revision number might not
> be sufficient to determine the system integration details for each
instance.
> I think having version for some devices and SoC name for others just adds
> to the confusion. Thus using specific chip name in the compatible property
> seems more clear to me.
> 
Well, I don't think so. Let's see the DMAC PL330. Its compatible is
"arm,pl330" and "arm,primecell" not SoC/Chip name. I think DWC is a same
case or at least similar.

You know, the DWC is a IP from Synopsis and I _Believe_ it has a kind of
version and it can be used for identify.

Thanks.

- Kukjin
