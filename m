From: Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>
Subject: Re: [PATCH v7 3/3] of/pci: mips: convert to common of_pci_range_parser
Date: Sat, 20 Apr 2013 18:33:43 -0400
Message-ID: <20130420223343.GB25724@titan.lakedaemon.net>
References: <1366107508-12672-1-git-send-email-Andrew.Murray@arm.com>
 <1366107508-12672-4-git-send-email-Andrew.Murray@arm.com>
 <CACRpkdbBaT1OKr5t8HW4+8y_wSDmGxmewAyVMekx8S-K9s3K8Q@mail.gmail.com>
 <20130418125910.GA17128@arm.com>
 <20130418130919.GI27197@titan.lakedaemon.net>
 <5170F016.6050502@openwrt.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <5170F016.6050502-p3rKhJxN3npAfugRpC6u6w@public.gmane.org>
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
To: Gabor Juhos <juhosg-p3rKhJxN3npAfugRpC6u6w@public.gmane.org>
Cc: "linux-mips-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org" <linux-mips-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org>, "siva.kallam-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org" <siva.kallam-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, "linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Liviu Dudau <Liviu.Dudau-5wv7dgnIgG8@public.gmane.org>, Paul Mackerras <paulus-eUNUBHrolfbYtjvyW6yDsg@public.gmane.org>, linux-samsung-soc <linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Jingoo Han <jg1.han-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Jason Gunthorpe <jgunthorpe-ePGOBjL8dl3ta4EC/59zMFaTQe2KTcn/@public.gmane.org>, "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, "rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org" <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Kukjin Kim <kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, "bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org" <bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "suren.reddy-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org" <suren.reddy-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Andrew Murray <andrew.murray-5wv7dgnIgG8@public.gmane.org>, linuxp
List-Id: linux-samsung-soc@vger.kernel.org

On Fri, Apr 19, 2013 at 09:19:50AM +0200, Gabor Juhos wrote:
> 2013.04.18. 15:09 keltez=E9ssel, Jason Cooper =EDrta:
> > On Thu, Apr 18, 2013 at 01:59:10PM +0100, Andrew Murray wrote:
> >> On Wed, Apr 17, 2013 at 04:42:48PM +0100, Linus Walleij wrote:
> >>> On Tue, Apr 16, 2013 at 12:18 PM, Andrew Murray <Andrew.Murray-AbSShOkvfpQ@public.gmane.org=
m> wrote:
> >>>
> >>>> This patch converts the pci_load_of_ranges function to use the new c=
ommon
> >>>> of_pci_range_parser.
> >>>>
> >>>> Signed-off-by: Andrew Murray <Andrew.Murray-5wv7dgnIgG8@public.gmane.org>
> >>>> Signed-off-by: Liviu Dudau <Liviu.Dudau-5wv7dgnIgG8@public.gmane.org>
> >>>> Reviewed-by: Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>
> >>>
> >>> Tested-by: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> >>
> >> Jason - you may not have seen this, but here (Linus Walleij) is anothe=
r Tested-by
> >> to add to this patch in your tree (if you can).
> > =

> > Thanks, I saw it.  Unfortunately, the PR was already sent, and the bran=
ch
> > is now pulled into arm-soc.
> =

> Sorry I had no time earlier, but I have tested this now on MIPS. The patch
> causes build errors unfortunately. Given the fact that this has been merg=
ed
> already, I will send a fixup patch.

Olof has dropped this branch from arm-soc, plase post the build error
and fix here so that it can be included in this series.

thx,

Jason.
