From: Vivek Gautam <gautamvivek1987-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v4 2/4] ARM: Exynos5250: Enabling ohci-exynos driver
Date: Mon, 4 Feb 2013 16:45:03 +0530
Message-ID: <CAFp+6iEEtq=ncTb9pWQSMpvW2S-eRpSPBBYM2SnUmmvVaA=Zvg@mail.gmail.com>
References: <1358257112-19595-1-git-send-email-gautam.vivek@samsung.com>
 <1358257112-19595-3-git-send-email-gautam.vivek@samsung.com>
 <2542030.a14I18dBkO@flatron>
 <0b0001ce0002$12ecda90$38c68fb0$@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <0b0001ce0002$12ecda90$38c68fb0$@samsung.com>
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
To: Kukjin Kim <kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Cc: linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, jg1.han-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, Tomasz Figa <tomasz.figa-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Vivek Gautam <gautam.vivek-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
List-Id: linux-samsung-soc@vger.kernel.org

Hi Kukjin,


On Fri, Feb 1, 2013 at 3:56 AM, Kukjin Kim <kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org> wrote:
> Tomasz Figa wrote:
>>
>> Hi Vivek,
>
> [...]
>
>> > +   usb@12120000 {
>> > +           compatible = "samsung,exynos4210-ohci";
>> > +           reg = <0x12120000 0x100>;
>> > +           interrupts = <0 71 0>;
>>
>> For Samsung platforms we decided per board enabling of nodes and so this
>> node should also contain:
>>
>>               status = "disabled";
>>
>> while in dts file of board using ohci there would be an overriding entry:
>>
>>       usb@12120000 {
>>               status = "okay";
>>       };
>>
>> I know that Exynos5250 has not been yet converted into this convention,
>> but using it when adding new devices will simplify the process.
>>
> Well, I have another opinion on this...
>
> Let's see, yeah, we are using following method in EXYNOS4 DT...
> - disabling IPs in SoC DT source and enabling IPs in board DT source
>
> But as I said, in EXYNOS5440 DT, I want to use following, because most of
> them should be enabled/used.
> - enabling IPs in SoC DT source and no need enabling in board DT source.
>
> I mean, it depends on each SoC's situation.
>

So, since USB 2.0 (EHCI/OHCI) shall be always enabled on almost all the boards,
so we shall keep it enabled in SOC DT source.

In that case following patches can be picked for a merge:
[PATCH v5 1/4] ARM: Exynos5250: Enabling ehci-s5p driver
http://www.mail-archive.com/linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org/msg12330.html

[PATCH v4 2/4] ARM: Exynos5250: Enabling ohci-exynos driver
http://www.mail-archive.com/linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org/msg12266.html

These will enable EHCI and OHCI support on exynos5250.
Please let me know if you want me to resend them. ;-)


-- 
Thanks & Regards
Vivek
