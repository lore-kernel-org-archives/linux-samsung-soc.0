From: Rahul Sharma <r.sh.open@gmail.com>
Subject: Adding set_blob ioctl to DRM
Date: Thu, 20 Feb 2014 00:25:50 +0530
Message-ID: <CAPdUM4PXxXgywMA8KnLhwAToHqfc0EP7HNDKjKJLK3T1HA7_eQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wi0-f178.google.com ([209.85.212.178]:52326 "EHLO
	mail-wi0-f178.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754402AbaBSSzv (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 19 Feb 2014 13:55:51 -0500
Received: by mail-wi0-f178.google.com with SMTP id cc10so954793wib.17
        for <linux-samsung-soc@vger.kernel.org>; Wed, 19 Feb 2014 10:55:50 -0800 (PST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, Inki Dae <inki.dae@samsung.com>, sunil joshi <joshi@samsung.com>, Prashanth G <prashanth.g@samsung.com>

Hi All,

I am working on enabling a Color Enhancement block for primary display
for Exynos SoC. I need to
set a bunch of parameters like Color Conversion matrix, Contrast
Improvement parameters etc ~ 30 parameters from User Space.

I am planning to use KDS blob property to receive these parameters.
Currently drivers are not allowed to create a blob property inside
drm. Neither, user space can set the blob. There is no ioctl provided
for same.

How about adding set_blob ioctl in DRM? It seems purposely dropped
till now. Please help me
in understanding explains the rationale.

What alternatives do I have inside drm to set multiple parameters
otherwise? (other than Exynos specific ioctls)

Please guide me.

Regards,
Rahul Sharma.
