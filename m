From: Yakir Yang <ykk@rock-chips.com>
Subject: Re: [PATCH v3 08/14] phy: Add driver for rockchip Display Port PHY
Date: Thu, 20 Aug 2015 02:01:19 -0500
Message-ID: <55D57B3F.2070507@rock-chips.com>
References: <1439995728-18046-1-git-send-email-ykk@rock-chips.com>
 <1439995877-18496-1-git-send-email-ykk@rock-chips.com>
 <55D55A3E.8090905@ti.com> <55D57A19.7020205@rock-chips.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1264559325=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <55D57A19.7020205@rock-chips.com>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Kishon Vijay Abraham I <kishon@ti.com>, Heiko Stuebner <heiko@sntech.de>, Thierry Reding <treding@nvidia.com>, Jingoo Han <jingoohan1@gmail.com>, Fabio Estevam <fabio.estevam@freescale.com>, Inki Dae <inki.dae@samsung.com>, joe@perches.com, Russell King <rmk+kernel@arm.linux.org.uk>
Cc: seanpaul@google.com, dri-devel@lists.freedesktop.org, Andrzej Hajda <a.hajda@samsung.com>, Gustavo Padovan <gustavo.padovan@collabora.co.uk>, linux-samsung-soc@vger.kernel.org, Vincent Palatin <vpalatin@chromium.org>, linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, dianders@google.com, Rob Herring <robh+dt@kernel.org>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Kyungmin Park <kyungmin.park@samsung.com>, djkurtz@google.com, Kumar Gala <galak@codeaurora.org>, ajaynumb@gmail.com, Andy Yan <andy.yan@rock-chips.com>
List-Id: linux-samsung-soc@vger.kernel.org

This is a multi-part message in MIME format.
--===============1264559325==
Content-Type: multipart/alternative;
 boundary="------------030706050500000405080505"

This is a multi-part message in MIME format.
--------------030706050500000405080505
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

Hi Kishon,

On 08/20/2015 01:56 AM, Yakir Yang wrote:
> Hi Kishon,
>
> On 08/19/2015 11:40 PM, Kishon Vijay Abraham I wrote:
> [...]
>>> [...]
>>> +MODULE_DEVICE_TABLE(of, rockchip_dp_phy_dt_ids);
>>> +
>>> +static struct platform_driver rockchip_dp_phy_driver = {
>>> +	.probe		= rockchip_dp_phy_probe,
>>> +	.driver		= {
>>> +		.name	= "rockchip-dp-phy",
>>> +		.owner	= THIS_MODULE,
>> owner is not required here.

Whoops, forget to reply this one.

Done.

- Yakir
>>
>> Thanks
>> Kishon
>>
>>
>>
>


--------------030706050500000405080505
Content-Type: text/html; charset=windows-1252
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta content="text/html; charset=windows-1252"
      http-equiv="Content-Type">
  </head>
  <body bgcolor="#FFFFFF" text="#000000">
    Hi Kishon,<br>
    <br>
    <div class="moz-cite-prefix">On 08/20/2015 01:56 AM, Yakir Yang
      wrote:<br>
    </div>
    <blockquote cite="mid:55D57A19.7020205@rock-chips.com" type="cite">
      <meta content="text/html; charset=windows-1252"
        http-equiv="Content-Type">
      Hi Kishon,<br>
      <br>
      <div class="moz-cite-prefix">On 08/19/2015 11:40 PM, Kishon Vijay
        Abraham I wrote:<br>
      </div>
      [...]<br>
      <blockquote cite="mid:55D55A3E.8090905@ti.com" type="cite">
        <blockquote type="cite">
          <pre wrap="">[...]
+MODULE_DEVICE_TABLE(of, rockchip_dp_phy_dt_ids);
+
+static struct platform_driver rockchip_dp_phy_driver = {
+	.probe		= rockchip_dp_phy_probe,
+	.driver		= {
+		.name	= "rockchip-dp-phy",
+		.owner	= THIS_MODULE,
</pre>
        </blockquote>
        <pre wrap="">owner is not required here.</pre>
      </blockquote>
    </blockquote>
    <br>
    Whoops, forget to reply this one.<br>
    <br>
    Done.<br>
    <br>
    - Yakir<br>
    <blockquote cite="mid:55D57A19.7020205@rock-chips.com" type="cite">
      <blockquote cite="mid:55D55A3E.8090905@ti.com" type="cite">
        <pre wrap="">

Thanks
Kishon



</pre>
      </blockquote>
      <br>
    </blockquote>
    <br>
  </body>
</html>

--------------030706050500000405080505--


--===============1264559325==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHA6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK

--===============1264559325==--
