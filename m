From: Ajay kumar <ajaynumb@gmail.com>
Subject: Re: [PATCH V7 11/12] Documentation: bridge: Add documentation for
 ps8622 DT properties
Date: Fri, 19 Sep 2014 19:29:29 +0530
Message-ID: <CAEC9eQMQrM289J+ukkshKtTo9dB=G4cvg-4zF6LR6snqE5BL0A@mail.gmail.com>
References: <1409150399-12534-1-git-send-email-ajaykumar.rs@samsung.com>
 <5419760A.7020908@ti.com>
 <CAEC9eQPn63upE6XEZZtJWGdOAhWWNvU9EhfOXJ=x0i467q+iMQ@mail.gmail.com>
 <5419B52D.4060107@ti.com>
 <CAEC9eQO2rfmVEKTCUJk+SpfdeUr81gN3stYV3wE6yR3E=-zonA@mail.gmail.com>
 <541C279A.2030601@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <541C279A.2030601@ti.com>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Tomi Valkeinen <tomi.valkeinen@ti.com>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Sean Paul <seanpaul@google.com>, Daniel Vetter <daniel.vetter@ffwll.ch>, sunil joshi <joshi@samsung.com>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Prashanth G <prashanth.g@samsung.com>, Ajay Kumar <ajaykumar.rs@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

On Fri, Sep 19, 2014 at 6:24 PM, Tomi Valkeinen <tomi.valkeinen@ti.com> wrote:
> On 18/09/14 08:50, Ajay kumar wrote:
>
>>>> Why do we need a complex graph when it can be handled using a simple phandle?
>>>
>>> Maybe in your case you can handle it with simple phandle. Can you
>>> guarantee that it's enough for everyone, on all platforms?
>> Yes, as of now exynos5420-peach-pit and exynos5250-spring boards use
>> this. In case of both, the phandle to bridge node is passed to the
>> exynos_dp node.
>>
>>> The point of the ports/endpoint graph is to also support more
>>> complicated scenarios. If you now create ps8622 bindings that do not
>>> support those graphs, the no one else using ps8622 can use
>>> ports/endpoint graphs either.
>>>
>>> Btw, is there an example how the bridge with these bindings is used in a
>>> board's .dts file? I couldn't find any example with a quick search. So
>>> it's unclear to me what the "simple phandle" actually is.
>> Please refer to the following link:
>> https://git.kernel.org/cgit/linux/kernel/git/kgene/linux-samsung.git/tree/arch/arm/boot/dts/exynos5420-peach-pit.dts?id=samsung-dt#n129
>> Let me know if you still think we would need to describe it as a complex graph!
>
> Yes, I think so. I'm not the DRM maintainer, though.
>
> I think we have two options:
>
> 1) Describe the video component connections with the ports/endpoints
> properly for all new display device bindings, and know that it's
> (hopefully) future proof and covers even the more complex boards that
> use the devices.
>
> or
>
> 2) Use some simple methods to describe the links, like single phandle as
> you do, knowing that we can't support more complex boards in the future.
I am not really able to understand, what's stopping us from using this
bridge on a board with "complex" display connections. To use ps8622 driver,
one needs to "attach" it to the DRM framework. For this, the DRM driver
would need the DT node for ps8622 bridge. For which I use a phandle.

If some XYZ platform wishes to pick the DT node via a different method,
they are always welcome to do it. Just because I am not specifying a
video port/endpoint in the DT binding example, would it mean that platform
cannot make use of ports in future? If that is the case, I can add something
like this:
http://lxr.free-electrons.com/source/Documentation/devicetree/bindings/panel/samsung,ld9040.txt#L61

Regards,
Ajay kumar

> I see some exynos boards already using the ports/endpoints, like
> arch/arm/boot/dts/exynos4412-trats2.dts. Why not use it for all new
> display devices?
>
>  Tomi
>
>
