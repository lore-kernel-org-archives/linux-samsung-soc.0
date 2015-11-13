From: Yakir Yang <ykk@rock-chips.com>
Subject: Re: [PATCH v9 15/17] drm: bridge: analogix/dp: try force hpd after
 plug in lookup failed
Date: Fri, 13 Nov 2015 15:31:19 +0800
Message-ID: <564591C7.3090704@rock-chips.com>
References: <1446020143-32645-1-git-send-email-ykk@rock-chips.com>
 <1446167355-6387-1-git-send-email-ykk@rock-chips.com>
 <20151111231042.GA29893@rob-hp-laptop> <5643EAF9.9020508@rock-chips.com>
 <20151112233807.GA9899@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0380717367=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <20151112233807.GA9899@rob-hp-laptop>
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
--===============0380717367==
Content-Type: multipart/alternative;
 boundary="------------080409030505040202090008"

This is a multi-part message in MIME format.
--------------080409030505040202090008
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit


On 11/13/2015 07:38 AM, Rob Herring wrote:
> On Thu, Nov 12, 2015 at 09:27:21AM +0800, Yakir Yang wrote:
>> Hi Rob,
>>
>> On 11/12/2015 07:10 AM, Rob Herring wrote:
>>> On Fri, Oct 30, 2015 at 09:09:15AM +0800, Yakir Yang wrote:
>>>> Some edp screen do not have hpd signal, so we can't just return
>>>> failed when hpd plug in detect failed.
>>>>
>>>> This is an hardware property, so we need add a devicetree property
>>>> "analogix,need-force-hpd" to indicate this sutiation.
>>>>
>>>> Tested-by: Heiko Stuebner <heiko@sntech.de>
>>>> Tested-by: Javier Martinez Canillas <javier@osg.samsung.com>
>>>> Signed-off-by: Yakir Yang <ykk@rock-chips.com>
>>>> ---
>>> I didn't find this one in v10. Did it get dropped?
>> You are in my 'to' list, but I haven't send the whole v10 out,
>> most of them don't need update :)
> Okay, it's just gmail's inability to follow threading...
>   
>> This series should be:
>> ---- [v8 0/17 ...]
>>    |---- [v8 1/17 ...]
>>    |---- [v8 2/17 ...]
>>    |---- [v8 3/17 ...]
>>    |---- [...]
>>    |---- [v8 15/17 ...]
>>    |---- [v8 16/17 ...]
>>    |---- [v8 17/17 ...]
>>    |
>>    |---- [v9 10/17 ...]
>>    |---- [v9 15/17 ...]
>>       |---- We are here
>>    |---- [v9 09/17 ...]
>>    |---- [v10 09/17 ...]
>>       |---- Received an acked from you
>
>>>> diff --git a/Documentation/devicetree/bindings/display/bridge/analogix_dp.txt b/Documentation/devicetree/bindings/display/bridge/analogix_dp.txt
>>>> index 7659a7a..74f0e80 100644
>>>> --- a/Documentation/devicetree/bindings/display/bridge/analogix_dp.txt
>>>> +++ b/Documentation/devicetree/bindings/display/bridge/analogix_dp.txt
>>>> @@ -22,6 +22,9 @@ Required properties for dp-controller:
>>>>   		from general PHY binding: Should be "dp".
>>>>   Optional properties for dp-controller:
>>>> +	-analogix,need-force-hpd:
>>>> +		Indicate driver need force hpd when hpd detect failed, this
>>>> +		is used for some eDP screen which don't have hpd signal.
>>> This should be a generic property.
>> This property would only need in some no-hpd case, it would be dropped if
>> panel keep the hotplug signal, that's why I thought it should be optional.
> I agree it is optional. I just mean drop the analogix and put in a
> common binding doc (i.e. create a display/bridge/common.txt). Needing to
> ignore HPD is probably a common problem.

Oops, okay, I misunderstand what you mean. I thought you want me to put the
"analogix,need-force-hpd" to required property, not an optional property :)

I thought this should be a common property of connect, so the common 
document
in bridge is not very good, I should be in display/connector/, but I 
don't know what
else could I collect for that common document, would like to share more 
on this point

- Yakir

>
>> I thought if we put this a property to generic property, then we must need
>> to define it in normal device node, not sure whether it is right :)
> Sorry, I don't follow.
>
> Rob
>
>
>


--------------080409030505040202090008
Content-Type: text/html; charset=windows-1252
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta content="text/html; charset=windows-1252"
      http-equiv="Content-Type">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <br>
    <div class="moz-cite-prefix">On 11/13/2015 07:38 AM, Rob Herring
      wrote:<br>
    </div>
    <blockquote cite="mid:20151112233807.GA9899@rob-hp-laptop"
      type="cite">
      <pre wrap="">On Thu, Nov 12, 2015 at 09:27:21AM +0800, Yakir Yang wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="">Hi Rob,

On 11/12/2015 07:10 AM, Rob Herring wrote:
</pre>
        <blockquote type="cite">
          <pre wrap="">On Fri, Oct 30, 2015 at 09:09:15AM +0800, Yakir Yang wrote:
</pre>
          <blockquote type="cite">
            <pre wrap="">Some edp screen do not have hpd signal, so we can't just return
failed when hpd plug in detect failed.

This is an hardware property, so we need add a devicetree property
"analogix,need-force-hpd" to indicate this sutiation.

Tested-by: Heiko Stuebner <a class="moz-txt-link-rfc2396E" href="mailto:heiko@sntech.de">&lt;heiko@sntech.de&gt;</a>
Tested-by: Javier Martinez Canillas <a class="moz-txt-link-rfc2396E" href="mailto:javier@osg.samsung.com">&lt;javier@osg.samsung.com&gt;</a>
Signed-off-by: Yakir Yang <a class="moz-txt-link-rfc2396E" href="mailto:ykk@rock-chips.com">&lt;ykk@rock-chips.com&gt;</a>
---
</pre>
          </blockquote>
          <pre wrap="">I didn't find this one in v10. Did it get dropped?
</pre>
        </blockquote>
        <pre wrap="">
You are in my 'to' list, but I haven't send the whole v10 out,
most of them don't need update :)
</pre>
      </blockquote>
      <pre wrap="">
Okay, it's just gmail's inability to follow threading...
 
</pre>
      <blockquote type="cite">
        <pre wrap="">This series should be:
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
</pre>
      </blockquote>
      <pre wrap="">

</pre>
      <blockquote type="cite">
        <blockquote type="cite">
          <blockquote type="cite">
            <pre wrap="">diff --git a/Documentation/devicetree/bindings/display/bridge/analogix_dp.txt b/Documentation/devicetree/bindings/display/bridge/analogix_dp.txt
index 7659a7a..74f0e80 100644
--- a/Documentation/devicetree/bindings/display/bridge/analogix_dp.txt
+++ b/Documentation/devicetree/bindings/display/bridge/analogix_dp.txt
@@ -22,6 +22,9 @@ Required properties for dp-controller:
 		from general PHY binding: Should be "dp".
 Optional properties for dp-controller:
+	-analogix,need-force-hpd:
+		Indicate driver need force hpd when hpd detect failed, this
+		is used for some eDP screen which don't have hpd signal.
</pre>
          </blockquote>
          <pre wrap="">This should be a generic property.
</pre>
        </blockquote>
        <pre wrap="">
This property would only need in some no-hpd case, it would be dropped if
panel keep the hotplug signal, that's why I thought it should be optional.
</pre>
      </blockquote>
      <pre wrap="">
I agree it is optional. I just mean drop the analogix and put in a 
common binding doc (i.e. create a display/bridge/common.txt). Needing to 
ignore HPD is probably a common problem.</pre>
    </blockquote>
    <br>
    Oops, okay,
    <meta http-equiv="content-type" content="text/html;
      charset=windows-1252">
    <span style="color: rgb(51, 51, 51); font-family: arial; font-size:
      18px; font-style: normal; font-variant: normal; font-weight:
      normal; letter-spacing: normal; line-height: 20px; orphans: auto;
      text-align: start; text-indent: 0px; text-transform: none;
      white-space: normal; widows: 1; word-spacing: 0px;
      -webkit-text-stroke-width: 0px; display: inline !important; float:
      none; background-color: rgb(255, 255, 255);">I misunderstand what
      you mean. I thought you want me to put the<br>
      "analogix,need-force-hpd" to required property, not an optional
      property :)<br>
      <br>
      I thought this should be a common property of connect, so the
      common document<br>
      in bridge is not very good, I should be in display/connector/, but
      I don't know what<br>
      else could I collect for that common document, would like to share
      more on this point <br>
      <br>
      - Yakir<br>
      <br>
    </span>
    <blockquote cite="mid:20151112233807.GA9899@rob-hp-laptop"
      type="cite">
      <pre wrap="">

</pre>
      <blockquote type="cite">
        <pre wrap="">I thought if we put this a property to generic property, then we must need
to define it in normal device node, not sure whether it is right :)
</pre>
      </blockquote>
      <pre wrap="">
Sorry, I don't follow.

Rob



</pre>
    </blockquote>
    <br>
  </body>
</html>

--------------080409030505040202090008--


--===============0380717367==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHA6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK

--===============0380717367==--
