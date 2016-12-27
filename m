From: Krzysztof Kozlowski <krzk-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [RFC PATCH 6/6] ARM64: exynos: add the pcie node for TM2
Date: Tue, 27 Dec 2016 18:33:28 +0200
Message-ID: <CAJKOXPcx-epK2=ug_ZtOGx5w755CN1xe7A+SgyS+rVFxG5ggcg@mail.gmail.com>
References: <20161226052029.10552-1-jh80.chung@samsung.com>
 <CGME20161226052031epcas1p43a300fe9e59c2af410c48861cd8554d1@epcas1p4.samsung.com>
 <20161226052029.10552-7-jh80.chung@samsung.com> <20161227163200.6noed454fmtgozrv@kozik-lap>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20161227163200.6noed454fmtgozrv@kozik-lap>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jaehoon Chung <jh80.chung-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Cc: linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, kgene-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, Krzysztof Kozlowski <krzk-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Javier Martinez Canillas <javier-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org>, kishon-l0cyMroinI0@public.gmane.org, will.deacon-5wv7dgnIgG8@public.gmane.org, catalin.marinas-5wv7dgnIgG8@public.gmane.org, cpgs-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org
List-Id: linux-samsung-soc@vger.kernel.org

On Tue, Dec 27, 2016 at 6:32 PM, Krzysztof Kozlowski <krzk-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> wrote:
> On Mon, Dec 26, 2016 at 02:20:29PM +0900, Jaehoon Chung wrote:
>> Add the Exxynos5433 pcie node for TM2.
>> This pcie device is used for supporting WiFi.
>>
>> And some gpios are already requested from pinctrl. so it doesn't need to
>> initialize.
>> GPJ2-0 is used for supplying to WiFi PCIe chip.
>>
>> Signed-off-by: Jaehoon Chung <jh80.chung-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
>> ---


Ahhh, and one more comment - please add missing 'dts' prefix in the subject.

BR,
Krzysztof
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
