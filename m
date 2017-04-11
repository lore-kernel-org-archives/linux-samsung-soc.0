From: Hans Verkuil <hansverk-FYB4Gu1CFyUAvxtiuMwx3w@public.gmane.org>
Subject: Re: [git:media_tree/master] [media] ARM: dts: exynos: add HDMI
 controller phandle to exynos4.dtsi
Date: Tue, 11 Apr 2017 10:39:08 +0200
Message-ID: <0c8fef60-a99d-c5ed-67e4-3769105fa211@cisco.com>
References: <E1cxc0o-0003RE-PP@www.linuxtv.org>
 <CAJKOXPfbJpFu6r9rS8oCqxTH+s7y2wYKx9+TzGrv4Cd8DYaKew@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAJKOXPfbJpFu6r9rS8oCqxTH+s7y2wYKx9+TzGrv4Cd8DYaKew-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Krzysztof Kozlowski <krzk-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mauro Carvalho Chehab <mchehab-JsYNTwtnfakRB7SZvlqPiA@public.gmane.org>
Cc: linuxtv-commits-dJidKbW2IEtAfugRpC6u6w@public.gmane.org, Marek Szyprowski <m.szyprowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Hans Verkuil <hans.verkuil-FYB4Gu1CFyUAvxtiuMwx3w@public.gmane.org>, linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-samsung-soc@vger.kernel.org

On 04/11/17 10:36, Krzysztof Kozlowski wrote:
> On Mon, Apr 10, 2017 at 6:12 PM, Mauro Carvalho Chehab
> <mchehab-JsYNTwtnfakRB7SZvlqPiA@public.gmane.org> wrote:
>> This is an automatic generated email to let you know that the following patch were queued:
>>
>> Subject: [media] ARM: dts: exynos: add HDMI controller phandle to exynos4.dtsi
>> Author:  Hans Verkuil <hans.verkuil-FYB4Gu1CFyUAvxtiuMwx3w@public.gmane.org>
>> Date:    Tue Dec 13 12:37:16 2016 -0200
>>
>> Add the new hdmi phandle to exynos4.dtsi. This phandle is needed by the
>> s5p-cec driver to initialize the CEC notifier framework.
>>
>> Tested with my Odroid U3.
>>
>> Signed-off-by: Hans Verkuil <hans.verkuil-FYB4Gu1CFyUAvxtiuMwx3w@public.gmane.org>
>> Tested-by: Marek Szyprowski <m.szyprowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
>> CC: linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
>> CC: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
>> CC: Krzysztof Kozlowski <krzk-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
>> Signed-off-by: Mauro Carvalho Chehab <mchehab-JsYNTwtnfakRB7SZvlqPiA@public.gmane.org>
>>
>>  arch/arm/boot/dts/exynos4.dtsi | 1 +
>>  1 file changed, 1 insertion(+)
>>
> 
> Mauro, you should not apply it. It is already going through samsung-soc [1].
> if you need this patch for bisectability or any other reasons, I
> provided a tag with it here:
> https://www.spinics.net/lists/devicetree/msg171182.html
> 
> Please drop the patch because now it will get duplicated.

I apologize for that. I realized that I shouldn't have included this in
my pull request when it was already merged.

My fault completely.

Regards,

	Hans

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
