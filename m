From: Hoegeun Kwon <hoegeun.kwon@samsung.com>
Subject: Re: [PATCH v2] drm/exynos: mic: add a bridge at probe
Date: Wed, 05 Jul 2017 18:40:37 +0900
Message-ID: <e44fcd2d-e8e3-5ad2-598b-785cb62a798d@samsung.com>
References: <CGME20170705081842epcas1p46d9f6868ad2f25712c8d41ae6ecd0358@epcas1p4.samsung.com>
 <1499242703-19153-1-git-send-email-inki.dae@samsung.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0647753367=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-reply-to: <1499242703-19153-1-git-send-email-inki.dae@samsung.com>
Content-language: en-US
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Inki Dae <inki.dae@samsung.com>, dri-devel@lists.freedesktop.org
Cc: linux-samsung-soc@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

This is a multi-part message in MIME format.
--===============0647753367==
Content-type: multipart/alternative;
	boundary="------------10B67BE3CE3E96A52428D31F"
Content-language: en-US

This is a multi-part message in MIME format.
--------------10B67BE3CE3E96A52428D31F
Content-Type: text/plain; charset="utf-8"; format="flowed"
Content-Transfer-Encoding: 7bit

On 07/05/2017 05:18 PM, Inki Dae wrote:
> This patch moves drm_bridge_add call into probe.
>
> It doesn't need to call drm_bridge_add call every time
> bind callback is called.
>
> Changelog v2
> - moved drm_bridge_remove call into remove callback.
> - corrected description.
>
> Suggested-by: Andrzej Hajda <a.hajda@samsung.com>
> Reviewed-by: Andrzej Hajda <a.hajda@samsung.com>
> Signed-off-by: Inki Dae <inki.dae@samsung.com>

Reviewed-by: Hoegeun Kwon <hoegeun.kwon@samsung.com>

Best regards,
Hoegeun


--------------10B67BE3CE3E96A52428D31F
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    On 07/05/2017 05:18 PM, Inki Dae wrote:<br>
    <blockquote type="cite"
      cite="mid:1499242703-19153-1-git-send-email-inki.dae@samsung.com">
      <pre wrap="">This patch moves drm_bridge_add call into probe.

It doesn't need to call drm_bridge_add call every time
bind callback is called.

Changelog v2
- moved drm_bridge_remove call into remove callback.
- corrected description.

Suggested-by: Andrzej Hajda <a class="moz-txt-link-rfc2396E" href="mailto:a.hajda@samsung.com">&lt;a.hajda@samsung.com&gt;</a>
Reviewed-by: Andrzej Hajda <a class="moz-txt-link-rfc2396E" href="mailto:a.hajda@samsung.com">&lt;a.hajda@samsung.com&gt;</a>
Signed-off-by: Inki Dae <a class="moz-txt-link-rfc2396E" href="mailto:inki.dae@samsung.com">&lt;inki.dae@samsung.com&gt;</a></pre>
    </blockquote>
    <br>
    Reviewed-by: Hoegeun Kwon <a class="moz-txt-link-rfc2396E"
      href="mailto:hoegeun.kwon@samsung.com">&lt;hoegeun.kwon@samsung.com&gt;</a>
    <br>
    <br>
    Best regards,
    <br>
    Hoegeun<br>
    <br>
  </body>
</html>

--------------10B67BE3CE3E96A52428D31F--

--===============0647753367==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==

--===============0647753367==--
