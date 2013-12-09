From: Jingoo Han <jg1.han@samsung.com>
Subject: Re: [PATCH] usb: ohci-exynos: Change to use phy provided by the
 generic phy framework
Date: Mon, 09 Dec 2013 18:26:08 +0900
Message-ID: <000001cef4c0$b123ba90$136b2fb0$%han@samsung.com>
References: <001401ceda8f$67f1ee50$37d5caf0$%han@samsung.com>
 <20131209015553.GA27542@kroah.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <20131209015553.GA27542@kroah.com>
Content-language: ko
Sender: linux-kernel-owner@vger.kernel.org
To: 'Greg KH' <greg@kroah.com>
Cc: linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, linux-usb@vger.kernel.org, devicetree@vger.kernel.org, linux-arm@vger.kernel.org, 'Kamil Debski' <k.debski@samsung.com>, 'Kyungmin Park' <kyungmin.park@samsung.com>, 'Kishon Vijay Abraham I' <kishon@ti.com>, 'Tomasz Figa' <t.figa@samsung.com>, 'Sylwester Nawrocki' <s.nawrocki@samsung.com>, m.szyprowski@samsung.com, gautam.vivek@samsung.com, 'Mateusz Krawczuk' <mat.krawczuk@gmail.com>, 'Yulgon Kim' <yulgon.kim@samsung.com>, 'Praveen Paneri' <p.paneri@samsung.com>, 'Anton Tikhomirov' <av.tikhomirov@samsung.com>, 'Kumar Gala' <galak@codeaurora.org>, 'Jingoo Han' <jg1.han@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

On Monday, December 09, 2013 10:56 AM, Greg KH wrote:
> On Wed, Nov 06, 2013 at 10:27:49AM +0900, Jingoo Han wrote:
> > Change the phy provider used from the old usb phy specific to a new one
> > using the generic phy framework.
> >
> > Signed-off-by: Jingoo Han <jg1.han@samsung.com>
> > Cc: Kamil Debski <k.debski@samsung.com>
> > ---
> > Exynos OHCI driver also uses Exynos USB2.0 PHY. Thus, I make this
> > patch based-on Kamil Debski's patchset for adding Exynos USB 2.0 PHY
> > driver.
> > (http://www.spinics.net/lists/linux-samsung-soc/msg24104.html)
> >
> >  drivers/usb/host/ohci-exynos.c |   28 ++++++++--------------------
> >  1 file changed, 8 insertions(+), 20 deletions(-)
> 
> This has some fuzz when applied to my tree, care to redo it against my
> usb-next branch of the usb.git tree on git.kernel.org?

Hi Greg,

This patch should be updated, based on Kamil Debski's  V4 patchset
for adding Exynos USB 2.0 PHY driver [1].
I will send v2 patch based on Kamil Debski's  V4 patchset [1].

[1] [PATCH v4 0/9] phy: Add new Exynos USB 2.0 PHY driver 
     (http://www.spinics.net/lists/linux-usb/msg98911.html)

Thank you.

Best regards,
Jingoo Han
