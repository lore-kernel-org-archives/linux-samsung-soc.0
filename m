From: Tomasz Figa <t.figa-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH 00/16] pinctrl: samsung: Usability and extensibiltiy
 improvements
Date: Wed, 10 Oct 2012 11:04:13 +0200
Message-ID: <2232733.TBZrPdcAAF@amdc1227>
References: <1349685556-23718-1-git-send-email-t.figa@samsung.com>
 <CACRpkdbUmM2=vhjhCq_qN2v=8RUDeWV4b8A8oXXPE4e8Z9C7zg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-reply-to: <CACRpkdbUmM2=vhjhCq_qN2v=8RUDeWV4b8A8oXXPE4e8Z9C7zg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
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
To: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, tomasz.figa-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, kyungmin.park-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, m.szyprowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org
List-Id: linux-samsung-soc@vger.kernel.org

On Wednesday 10 of October 2012 09:46:28 Linus Walleij wrote:
> On Mon, Oct 8, 2012 at 10:39 AM, Tomasz Figa <t.figa-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org> wrote:
> > This patch series is a work on improving usability and extensibiltiy of
> > the> 
> > pinctrl-samsung driver. It consists of three main parts:
> >  - moving SoC-specific data to device tree
> >  - converting the driver to use one GPIO chip and one IRQ domain per
> >  pin bank - introducing generic wake-up interrupt capability
> >  description
> 
> So can you prepare a patch series which does all but the first
> bullet to begin with, and a SoC-and register offset patch
> on top of that as a separate series, because it is controversial?
> 
> I don't like that these two things are mingled together like this
> in an all-or-nothing manner.
> 
> So I'm OK with a patch series for bulle (2) and (3) but not (1).

As I already stated in my other replies, patches for (2) and (3) depend on 
(1), because current architecture of the driver makes it hard to implement 
in an elegant way, so some code would have to be reworked anyway.

I should still have some preliminary work on this in one of my branches in 
my working tree, but it was heavily incomplete, as it turned out that using 
DT would simplify some things.

Best regards,
-- 
Tomasz Figa
Samsung Poland R&D Center
