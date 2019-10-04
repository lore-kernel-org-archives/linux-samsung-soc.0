Return-Path: <SRS0=VUgU=X5=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB6E2C47404
	for <linux-samsung-soc@archiver.kernel.org>; Fri,  4 Oct 2019 15:14:34 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 7F1E4222C9
	for <linux-samsung-soc@archiver.kernel.org>; Fri,  4 Oct 2019 15:14:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1570202074;
	bh=T+96WbhywkN9TZ3RgQsCxJM8eZpY0gKukrAqlx2v0jM=;
	h=From:To:Subject:Date:In-Reply-To:References:List-ID:From;
	b=astUBTjXUkx6sdJAsd3PqroD1FZtlZ5498Ip3RiC4fOcXIql1gFnMJ28oMj4EP2z4
	 OPdPIOfwUwK3iaSqt7oIaPvOXO7br5Qohyfv3sOBWoZ875QCiaEUuTaKdVTlUBF7/9
	 LvJ5x9PXR3y2I3Q8K3nOOAH1QLUuQ/zheM9gLlHU=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389776AbfJDPOb (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Fri, 4 Oct 2019 11:14:31 -0400
Received: from mail.kernel.org ([198.145.29.99]:52224 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2389596AbfJDPOa (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 4 Oct 2019 11:14:30 -0400
Received: from localhost.localdomain (unknown [194.230.155.145])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id BA3AC222C2;
        Fri,  4 Oct 2019 15:14:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1570202070;
        bh=T+96WbhywkN9TZ3RgQsCxJM8eZpY0gKukrAqlx2v0jM=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=XbNy0vjvtdDr7yclvUmZXuFX91a7a2NmRHOkhWFrYJdsLiTWwiw/PY+VE2zOSgaJc
         JFCE8U5N2omSGBkLx5Jk0Qwqr+2WfhjbCDPbIZ3uKUHxw7weadLSquNzRFbcUSBly3
         QGtdp9XUgZgmaydqz8uauSYOun9jHAwHXMzTCQrE=
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     Kukjin Kim <kgene@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Lee Jones <lee.jones@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Maciej Falkowski <m.falkowski@samsung.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-serial@vger.kernel.org
Subject: [PATCH 2/3] dt-bindings: gpu: samsung-rotator: Fix indentation
Date:   Fri,  4 Oct 2019 17:14:13 +0200
Message-Id: <20191004151414.8458-2-krzk@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191004151414.8458-1-krzk@kernel.org>
References: <20191004151414.8458-1-krzk@kernel.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20191004151413.SJEpYbwUlqeoN0xIV4ciTjkyUXTp0VGOoeEg_m3MJ68@z>

Array elements under 'items' should be indented.

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 Documentation/devicetree/bindings/gpu/samsung-rotator.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/gpu/samsung-rotator.yaml b/Documentation/devicetree/bindings/gpu/samsung-rotator.yaml
index 45ce562435fa..f4dfa6fc724c 100644
--- a/Documentation/devicetree/bindings/gpu/samsung-rotator.yaml
+++ b/Documentation/devicetree/bindings/gpu/samsung-rotator.yaml
@@ -27,7 +27,7 @@ properties:
 
   clock-names:
     items:
-    - const: rotator
+      - const: rotator
 
 required:
   - compatible
-- 
2.17.1

