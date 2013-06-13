From: Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>
Subject: Re: [RFC 0/2] exynos5250/hdmi: replace dummy hdmiphy clock with pmu
 reg control
Date: Thu, 13 Jun 2013 18:24:05 +0530
Message-ID: <51B9C0ED.2040605@ti.com>
References: <1370935073-7475-1-git-send-email-rahul.sharma@samsung.com>
 <CAAQKjZMuSQhbYtOyni-RdHhXu0fv3U2Dm_2iqRLe0smSt_jjjQ@mail.gmail.com>
 <CAAQKjZOZCtLnE_OPs60NU+Z4pkHiSCqZcBOi1Dv+PC=01HKqyg@mail.gmail.com>
 <CAPdUM4Nis0uwyZf1hNDOMmdqFm0K7beVPoyAWRjMBwq0jcwwCQ@mail.gmail.com>
 <51B98908.8050403@samsung.com>
 <02c101ce6828$29ab0f20$7d012d60$%dae@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <02c101ce6828$29ab0f20$7d012d60$%dae-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
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
To: Inki Dae <inki.dae-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Cc: linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, 'Seung-Woo Kim' <sw0312.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, 'sunil joshi' <joshi-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, 'DRI mailing list' <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, 'Kukjin Kim' <kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, 'Sylwester Nawrocki' <s.nawrocki-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, 'Rahul Sharma' <r.sh.open-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, 'Rahul Sharma' <rahul.sharma-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
List-Id: linux-samsung-soc@vger.kernel.org

Hi,

On Thursday 13 June 2013 04:51 PM, Inki Dae wrote:
>
>
>> -----Original Message-----
>> From: Sylwester Nawrocki [mailto:s.nawrocki-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org]
>> Sent: Thursday, June 13, 2013 5:56 PM
>> To: Rahul Sharma
>> Cc: Rahul Sharma; Inki Dae; linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org; devicetree-
>> discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org; DRI mailing list; Kukjin Kim; Seung-Woo Kim;
>> Sean Paul; sunil joshi; Kishon Vijay Abraham I; Stephen Warren;
>> grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
>> Subject: Re: [RFC 0/2] exynos5250/hdmi: replace dummy hdmiphy clock with
>> pmu reg control
>>
>> Hi,
>>
>> On 06/13/2013 06:26 AM, Rahul Sharma wrote:
>>> Mr. Dae,
>>>
>>> Thanks for your valuable inputs.
>>>
>>> I posted it as RFC because, I also have received comments to register
>>> hdmiphy as a clock controller. As we always configure it for specific
>>> frequency, hdmi-phy looks similar to a PLL. But it really doesn't
>>> belong to that class. Secondly prior to exynos5420, it was a i2c
>>> device. I am not sure we can register a I2C device as a clock
>>> controller. I wanted to discuss and explore this option here.
>>
>> Have you considered using the generic PHY framework for those HDMI
>> PHY devices [1] ? I guess we could add a dedicated group of ops for
>> video PHYs, similarly as is is done with struct v4l2_subdev_ops. For
>> configuring things like the carrier/pixel clock frequency or anything
>> what's common across the video PHYs.
>>
>> Perhaps you could have a look and see if this framework would be
>> useful for HDMI and possibly point out anything what might be missing ?
>>
>> I'm not sure it it really solves the issues specific to the Exynos
>> HDMI but at least with a generic PHY driver the PHY module would be
>> separate from the PHY controller, as often same HDMI DPHY can be used
>> with various types of a HDMI controller. So this would allow to not
>> duplicate the HDMI PHY drivers in the long-term perspective.
>
> Yeah, at least, it seems that we could use PHY module to control PMU
> register, HDMI_PHY_CONTROL. However, PHY module provides only init/on/off
> callbacks. As you may know, HDMIPHY needs i2c interfaces to control HDMIPHY
> clock. So with PHY module, HDMIPHY driver could enable PMU more generically,
> but also has to use existing i2c stuff to control HDMIPHY clock. I had a
> quick review to Generic PHY Framework[v6] but I didn't see that the PHY
> module could generically support more features such as i2c stuff.

I don't think PHY framework needs to provide i2c interfaces to program 
certain configurations. Instead in one of the callbacks (init/on/off) 
PHY driver can program whatever it wants using any of the interfaces it 
needs. IMO PHY framework should work independent of the interfaces.

For example, twl4030 phy driver actually uses i2c to program its 
registers but still it uses the PHY framework [1].

[1] --> http://www.gossamer-threads.com/lists/linux/kernel/1729414

Thanks
Kishon
