From: Sylwester Nawrocki <sylvester.nawrocki-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [RFC/PATCH 06/13] media: s5p-fimc: Add device tree support for
 FIMC-LITE
Date: Tue, 17 Jul 2012 20:55:26 +0200
Message-ID: <5005B51E.20505@gmail.com>
References: <4FBFE1EC.9060209@samsung.com>
 <1337975573-27117-1-git-send-email-s.nawrocki@samsung.com>
 <1337975573-27117-6-git-send-email-s.nawrocki@samsung.com>
 <Pine.LNX.4.64.1207161114130.12302@axis700.grange>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <Pine.LNX.4.64.1207161114130.12302-0199iw4Nj15frtckUFj5Ag@public.gmane.org>
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
To: Guennadi Liakhovetski <g.liakhovetski-Mmb7MZpHnFY@public.gmane.org>
Cc: linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, b.zolnierkie-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, riverful.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, sw0312.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, kyungmin.park-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, Sylwester Nawrocki <s.nawrocki-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, m.szyprowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org
List-Id: linux-samsung-soc@vger.kernel.org

On 07/16/2012 11:15 AM, Guennadi Liakhovetski wrote:
>> --- a/Documentation/devicetree/bindings/camera/soc/samsung-fimc.txt
>> +++ b/Documentation/devicetree/bindings/camera/soc/samsung-fimc.txt
>> @@ -39,6 +39,21 @@ Required properties:
>>   	       depends on the SoC revision. For S5PV210 valid values are:
>>   	       0...2, for Exynos4x1x: 0...3.
>>
>> +
>> +'fimc-lite' device node
>> +-----------------------
>> +
>> +Required properties:
>> +
>> +- compatible : should be one of:
>> +		"samsung,exynos4212-fimc";
>> +		"samsung,exynos4412-fimc";
>> +- reg	     : physical base address and size of the device's memory mapped
>> +	       registers;
>> +- interrupts : should contain FIMC-LITE interrupt;
>> +- cell-index : FIMC-LITE IP instance index;
>
> Same as in an earlier patch - not sure this is needed.

It is needed for setting up a pipeline of multiple sub-device
within a SoC. As I commented on patch 2/13 I'd like to replace
this with proper entries in the "aliases" node. Some sub-devices
have registers that these indexes need to be directly written to.

--

Thanks,
Sylwester
