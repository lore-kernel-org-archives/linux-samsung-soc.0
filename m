From: Yakir Yang <ykk@rock-chips.com>
Subject: Re: [PATCH v9 15/17] drm: bridge: analogix/dp: try force hpd after
 plug in lookup failed
Date: Thu, 12 Nov 2015 09:27:21 +0800
Message-ID: <5643EAF9.9020508@rock-chips.com>
References: <1446020143-32645-1-git-send-email-ykk@rock-chips.com>
 <1446167355-6387-1-git-send-email-ykk@rock-chips.com>
 <20151111231042.GA29893@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0998867891=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <20151111231042.GA29893@rob-hp-laptop>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Rob Herring <robh@kernel.org>
Cc: Krzysztof Kozlowski <k.kozlowski@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, linux-kernel@vger.kernel.org, Andrzej Hajda <a.hajda@samsung.com>, Gustavo Padovan <gustavo.padovan@collabora.co.uk>, linux-samsung-soc@vger.kernel.org, Russell King <linux@arm.linux.org.uk>, linux-rockchip@lists.infradead.org, Kishon Vijay Abraham I <kishon@ti.com>, javier@osg.samsung.com, Kukjin Kim <kgene@kernel.org>, robherring2@gmail.com, Thierry Reding <treding@nvidia.com>, devicetree@vger.kernel.org, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, Jingoo Han <jingoohan1@gmail.com>, emil.l.velikov@gmail.com, dianders@chromium.org, Kyungmin Park <kyungmin.park@samsung.com>, Kumar Gala <galak@codeaurora.org>, ajaynumb@gmail.com, Andy Yan <andy.yan@rock-chips.com>
List-Id: linux-samsung-soc@vger.kernel.org

This is a multi-part message in MIME format.
--===============0998867891==
Content-Type: multipart/alternative;
 boundary="------------060309030609020801040807"

This is a multi-part message in MIME format.
--------------060309030609020801040807
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

Hi Rob,

On 11/12/2015 07:10 AM, Rob Herring wrote:
> On Fri, Oct 30, 2015 at 09:09:15AM +0800, Yakir Yang wrote:
>> Some edp screen do not have hpd signal, so we can't just return
>> failed when hpd plug in detect failed.
>>
>> This is an hardware property, so we need add a devicetree property
>> "analogix,need-force-hpd" to indicate this sutiation.
>>
>> Tested-by: Heiko Stuebner <heiko@sntech.de>
>> Tested-by: Javier Martinez Canillas <javier@osg.samsung.com>
>> Signed-off-by: Yakir Yang <ykk@rock-chips.com>
>> ---
> I didn't find this one in v10. Did it get dropped?

You are in my 'to' list, but I haven't send the whole v10 out,
most of them don't need update :)

This series should be:
---- [v8 0/17 ...]
   |---- [v8 1/17 ...]
   |---- [v8 2/17 ...]
   |---- [v8 3/17 ...]
   |---- [...]
   |---- [v8 15/17 ...]
   |---- [v8 16/17 ...]
   |---- [v8 17/17 ...]
   |
   |---- [v9 10/17 ...]
   |---- [v9 15/17 ...]
      |---- We are here
   |---- [v9 09/17 ...]
   |---- [v10 09/17 ...]
      |---- Received an acked from you

>
>> Changes in v9: None
>> Changes in v8: None
>> Changes in v7: None
>> Changes in v6: None
>> Changes in v5: None
>> Changes in v4: None
>> Changes in v3:
>> - Add "analogix,need-force-hpd" to indicate whether driver need foce
>>    hpd when hpd detect failed.
>>
>> Changes in v2: None
>>
>>   .../bindings/display/bridge/analogix_dp.txt        |  4 ++-
>>   .../bindings/display/exynos/exynos_dp.txt          |  1 +
>>   .../display/rockchip/analogix_dp-rockchip.txt      |  1 +
>>   drivers/gpu/drm/bridge/analogix/analogix_dp_core.c | 36 +++++++++++++++++++---
>>   drivers/gpu/drm/bridge/analogix/analogix_dp_core.h |  2 ++
>>   drivers/gpu/drm/bridge/analogix/analogix_dp_reg.c  |  9 ++++++
>>   6 files changed, 47 insertions(+), 6 deletions(-)
>>
>> diff --git a/Documentation/devicetree/bindings/display/bridge/analogix_dp.txt b/Documentation/devicetree/bindings/display/bridge/analogix_dp.txt
>> index 7659a7a..74f0e80 100644
>> --- a/Documentation/devicetree/bindings/display/bridge/analogix_dp.txt
>> +++ b/Documentation/devicetree/bindings/display/bridge/analogix_dp.txt
>> @@ -22,6 +22,9 @@ Required properties for dp-controller:
>>   		from general PHY binding: Should be "dp".
>>   
>>   Optional properties for dp-controller:
>> +	-analogix,need-force-hpd:
>> +		Indicate driver need force hpd when hpd detect failed, this
>> +		is used for some eDP screen which don't have hpd signal.
> This should be a generic property.

This property would only need in some no-hpd case, it would be dropped if
panel keep the hotplug signal, that's why I thought it should be optional.

I thought if we put this a property to generic property, then we must need
to define it in normal device node, not sure whether it is right :)

Thanks,
- Yakir

>
> Rob
>
>
>


--------------060309030609020801040807
Content-Type: text/html; charset=windows-1252
Content-Transfer-Encoding: quoted-printable

<html>
  <head>
    <meta content=3D"text/html; charset=3Dwindows-1252"
      http-equiv=3D"Content-Type">
  </head>
  <body text=3D"#000000" bgcolor=3D"#FFFFFF">
    Hi Rob,<br>
    <br>
    <div class=3D"moz-cite-prefix">On 11/12/2015 07:10 AM, Rob Herring
      wrote:<br>
    </div>
    <blockquote cite=3D"mid:20151111231042.GA29893@rob-hp-laptop"
      type=3D"cite">
      <pre wrap=3D"">On Fri, Oct 30, 2015 at 09:09:15AM +0800, Yakir Yang=
 wrote:
</pre>
      <blockquote type=3D"cite">
        <pre wrap=3D"">Some edp screen do not have hpd signal, so we can'=
t just return
failed when hpd plug in detect failed.

This is an hardware property, so we need add a devicetree property
"analogix,need-force-hpd" to indicate this sutiation.

Tested-by: Heiko Stuebner <a class=3D"moz-txt-link-rfc2396E" href=3D"mail=
to:heiko@sntech.de">&lt;heiko@sntech.de&gt;</a>
Tested-by: Javier Martinez Canillas <a class=3D"moz-txt-link-rfc2396E" hr=
ef=3D"mailto:javier@osg.samsung.com">&lt;javier@osg.samsung.com&gt;</a>
Signed-off-by: Yakir Yang <a class=3D"moz-txt-link-rfc2396E" href=3D"mail=
to:ykk@rock-chips.com">&lt;ykk@rock-chips.com&gt;</a>
---
</pre>
      </blockquote>
      <pre wrap=3D"">
I didn't find this one in v10. Did it get dropped?</pre>
    </blockquote>
    <br>
    <meta http-equiv=3D"content-type" content=3D"text/html;
      charset=3Dwindows-1252">
    You are in my 'to' list, but I haven't send the whole v10 out,<br>
    most of them don't need update :)<br>
    <br>
    This series should be:<br>
    ---- [v8 0/17 ...]<br>
    =A0 |---- [v8 1/17 ...]<br>
    =A0 |---- [v8 2/17 ...]<br>
    =A0 |---- [v8 3/17 ...]<br>
    =A0 |---- [...] <br>
    =A0 |---- [v8 15/17 ...]<br>
    =A0 |---- [v8 16/17 ...]<br>
    =A0 |---- [v8 17/17 ...]<br>
    =A0 |<br>
    =A0 |---- [v9 10/17 ...]<br>
    =A0 |---- [v9 15/17 ...]<br>
    =A0=A0=A0=A0 |---- We are here<br>
    =A0 |---- [v9 09/17 ...]<br>
    =A0 |---- [v10 09/17 ...]<br>
    =A0=A0=A0=A0 |---- Received an acked from you<br>
    <br>
    <blockquote cite=3D"mid:20151111231042.GA29893@rob-hp-laptop"
      type=3D"cite"><br>
      <blockquote type=3D"cite">
        <pre wrap=3D"">Changes in v9: None
Changes in v8: None
Changes in v7: None
Changes in v6: None
Changes in v5: None
Changes in v4: None
Changes in v3:
- Add "analogix,need-force-hpd" to indicate whether driver need foce
  hpd when hpd detect failed.

Changes in v2: None

 .../bindings/display/bridge/analogix_dp.txt        |  4 ++-
 .../bindings/display/exynos/exynos_dp.txt          |  1 +
 .../display/rockchip/analogix_dp-rockchip.txt      |  1 +
 drivers/gpu/drm/bridge/analogix/analogix_dp_core.c | 36 ++++++++++++++++=
+++---
 drivers/gpu/drm/bridge/analogix/analogix_dp_core.h |  2 ++
 drivers/gpu/drm/bridge/analogix/analogix_dp_reg.c  |  9 ++++++
 6 files changed, 47 insertions(+), 6 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/bridge/analogix_dp=
.txt b/Documentation/devicetree/bindings/display/bridge/analogix_dp.txt
index 7659a7a..74f0e80 100644
--- a/Documentation/devicetree/bindings/display/bridge/analogix_dp.txt
+++ b/Documentation/devicetree/bindings/display/bridge/analogix_dp.txt
@@ -22,6 +22,9 @@ Required properties for dp-controller:
 		from general PHY binding: Should be "dp".
=20
 Optional properties for dp-controller:
+	-analogix,need-force-hpd:
+		Indicate driver need force hpd when hpd detect failed, this
+		is used for some eDP screen which don't have hpd signal.
</pre>
      </blockquote>
      <pre wrap=3D"">
This should be a generic property.</pre>
    </blockquote>
    <br>
    This property would only need in some no-hpd case, it would be
    dropped if<br>
    panel keep the hotplug signal, that's why I thought it should be
    optional.<br>
    <br>
    I thought if we put this a property to generic property, then we
    must need<br>
    to define it in normal device node, not sure whether it is right :)
    <br>
    <br>
    Thanks,<br>
    - Yakir<br>
    <br>
    <blockquote cite=3D"mid:20151111231042.GA29893@rob-hp-laptop"
      type=3D"cite">
      <pre wrap=3D"">

Rob



</pre>
    </blockquote>
    <br>
  </body>
</html>

--------------060309030609020801040807--


--===============0998867891==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHA6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK

--===============0998867891==--
