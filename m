From: Kukjin Kim <kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: RE: [PATCH v4 2/4] ARM: Exynos5250: Enabling ohci-exynos driver
Date: Thu, 31 Jan 2013 14:26:51 -0800
Message-ID: <0b0001ce0002$12ecda90$38c68fb0$@samsung.com>
References: <1358257112-19595-1-git-send-email-gautam.vivek@samsung.com>
 <1358257112-19595-3-git-send-email-gautam.vivek@samsung.com>
 <2542030.a14I18dBkO@flatron>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-reply-to: <2542030.a14I18dBkO@flatron>
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
To: 'Tomasz Figa' <tomasz.figa-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, 'Vivek Gautam' <gautam.vivek-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Cc: jg1.han-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-samsung-soc@vger.kernel.org

Tomasz Figa wrote:
> 
> Hi Vivek,

[...]

> > +	usb@12120000 {
> > +		compatible = "samsung,exynos4210-ohci";
> > +		reg = <0x12120000 0x100>;
> > +		interrupts = <0 71 0>;
> 
> For Samsung platforms we decided per board enabling of nodes and so this
> node should also contain:
> 
> 		status = "disabled";
> 
> while in dts file of board using ohci there would be an overriding entry:
> 
> 	usb@12120000 {
> 		status = "okay";
> 	};
> 
> I know that Exynos5250 has not been yet converted into this convention,
> but using it when adding new devices will simplify the process.
> 
Well, I have another opinion on this...

Let's see, yeah, we are using following method in EXYNOS4 DT...
- disabling IPs in SoC DT source and enabling IPs in board DT source

But as I said, in EXYNOS5440 DT, I want to use following, because most of
them should be enabled/used.
- enabling IPs in SoC DT source and no need enabling in board DT source.

I mean, it depends on each SoC's situation.

Thanks.

- Kukjin
