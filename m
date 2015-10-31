From: Yakir Yang <ykk-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Subject: Re: [PATCH v8 11/17] dt-bindings: add document for rockchip dp phy
Date: Sat, 31 Oct 2015 11:13:48 +0800
Message-ID: <563431EC.9050701@rock-chips.com>
References: <1446020143-32645-1-git-send-email-ykk@rock-chips.com>
 <1446021068-11655-1-git-send-email-ykk@rock-chips.com>
 <CAL_JsqL=pL8SXLEzhbJHS_djFSh+Ctky0igzagZ6E0M9Q_TFuA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <linux-rockchip-bounces+glpar-linux-rockchip=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
In-Reply-To: <CAL_JsqL=pL8SXLEzhbJHS_djFSh+Ctky0igzagZ6E0M9Q_TFuA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-rockchip>,
 <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-rockchip/>
List-Post: <mailto:linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-rockchip>,
 <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-rockchip" <linux-rockchip-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-rockchip-bounces+glpar-linux-rockchip=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Krzysztof Kozlowski <k.kozlowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>, Seung-Woo Kim <sw0312.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Daniel Kurtz <djkurtz-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Andrzej Hajda <a.hajda-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Gustavo Padovan <gustavo.padovan-ZGY8ohtN/8pPYcu2f3hruQ@public.gmane.org>, "linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Joonyoung Shim <jy0922.shim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, "open list:ARM/Rockchip SoC..." <linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>, Javier Martinez Canillas <javier-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org>, Kukjin Kim <kgene-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Inki Dae <inki.dae-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Sean Paul <seanpau>
List-Id: linux-samsung-soc@vger.kernel.org


On 10/31/2015 12:42 AM, Rob Herring wrote:
> On Wed, Oct 28, 2015 at 3:31 AM, Yakir Yang <ykk-TNX95d0MmH7DzftRWevZcw@public.gmane.org> wrote:
>> Add dt binding documentation for rockchip display port PHY.
>>
>> Reviewed-by: Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
>> Signed-off-by: Yakir Yang <ykk-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
> Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>

Thanks,

- Yakir

>> ---
>> Changes in v8:
>> - Remove the specific address in the example node name. (Heiko)
>>
>> Changes in v7:
>> - Simplify the commit message. (Kishon)
>>
>> Changes in v6: None
>> Changes in v5:
>> - Split binding doc's from driver changes. (Rob)
>> - Update the rockchip,grf explain in document, and correct the clock required
>>    elemets in document. (Rob & Heiko)
>>
>> Changes in v4: None
>> Changes in v3: None
>> Changes in v2: None
>>
>>   .../devicetree/bindings/phy/rockchip-dp-phy.txt    | 22 ++++++++++++++++++++++
>>   1 file changed, 22 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/phy/rockchip-dp-phy.txt
>>
>> diff --git a/Documentation/devicetree/bindings/phy/rockchip-dp-phy.txt b/Documentation/devicetree/bindings/phy/rockchip-dp-phy.txt
>> new file mode 100644
>> index 0000000..00902cb
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/phy/rockchip-dp-phy.txt
>> @@ -0,0 +1,22 @@
>> +Rockchip Soc Seroes Display Port PHY
>> +------------------------------------
>> +
>> +Required properties:
>> +- compatible : should be one of the following supported values:
>> +        - "rockchip.rk3288-dp-phy"
>> +- clocks: from common clock binding: handle to dp clock.
>> +       of memory mapped region.
>> +- clock-names: from common clock binding:
>> +       Required elements: "24m"
>> +- rockchip,grf: phandle to the syscon managing the "general register files"
>> +- #phy-cells : from the generic PHY bindings, must be 0;
>> +
>> +Example:
>> +
>> +edp_phy: edp-phy {
>> +       compatible = "rockchip,rk3288-dp-phy";
>> +       rockchip,grf = <&grf>;
>> +       clocks = <&cru SCLK_EDP_24M>;
>> +       clock-names = "24m";
>> +       #phy-cells = <0>;
>> +};
>> --
>> 1.9.1
>>
>>
>
>
