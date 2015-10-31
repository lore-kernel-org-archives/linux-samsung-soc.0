From: Yakir Yang <ykk-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Subject: Re: [PATCH v8 09/17] dt-bindings: add document for rockchip variant
 of analogix_dp
Date: Sat, 31 Oct 2015 11:15:47 +0800
Message-ID: <56343263.7090401@rock-chips.com>
References: <1446020143-32645-1-git-send-email-ykk@rock-chips.com>
 <1446020905-10670-1-git-send-email-ykk@rock-chips.com>
 <CAL_JsqLxkz43gj-O+r0LURg0_41SrDB7g8EAHwjxbytoUPijhA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAL_JsqLxkz43gj-O+r0LURg0_41SrDB7g8EAHwjxbytoUPijhA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Inki Dae <inki.dae-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Andrzej Hajda <a.hajda-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Joonyoung Shim <jy0922.shim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Seung-Woo Kim <sw0312.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Kyungmin Park <kyungmin.park-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Jingoo Han <jingoohan1-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Krzysztof Kozlowski <k.kozlowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>, Mark Yao <mark.yao-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Daniel Kurtz <djkurtz-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Doug Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Sean Paul <seanpaul-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Kukjin Kim <kgene-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, emil.l.velikov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Gustavo Padovan <gustavo.padovan-ZGY8ohtN/8pPYcu2f3hruQ@public.gmane.org>, Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Ajay kumar <ajaynumb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Javier Martinez Canillas <javier-JPH+aEBZ4P/iSf3S8Y7g3A@public.gmane.org>
List-Id: linux-samsung-soc@vger.kernel.org

Hi Rob,

On 10/31/2015 12:46 AM, Rob Herring wrote:
> On Wed, Oct 28, 2015 at 3:28 AM, Yakir Yang <ykk-TNX95d0MmH7DzftRWevZcw@public.gmane.org> wrote:
>> Rockchip DP driver is a helper driver of analogix_dp coder driver,
>> so most of the DT property should be descriped in analogix_dp document.
>>
>> Reviewed-by: Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
>> Signed-off-by: Yakir Yang <ykk-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
>> ---
> Looks mostly fine to me.
>
> [...]
>
>> +- rockchip,grf: this soc should set GRF regs, so need get grf here.
>> +
>> +- ports: contain a port node with endpoint definitions as defined in
>> +  Documentation/devicetree/bindings/media/video-interfaces.txt.
> Please document that you have 2 ports 0 and 1, port0 has 2 endpoints
> for ? and port1 has 1 endpoint connected to a panel(or another
> bridge). Otherwise that is only evident from the example.

Okay, looks great.

Thanks,
- Yakir

> Rob
>
>
>


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
