From: Mike Dyer <mike.dyer@md-soft.co.uk>
Subject: s5p-mfc cyclic refresh and slicing
Date: Sat, 03 Nov 2012 10:44:16 +0000
Message-ID: <1351939456.1915.10.camel@edge.config>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wg0-f44.google.com ([74.125.82.44]:61277 "EHLO
	mail-wg0-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750875Ab2KCKoY (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sat, 3 Nov 2012 06:44:24 -0400
Received: by mail-wg0-f44.google.com with SMTP id dr13so2909861wgb.1
        for <linux-samsung-soc@vger.kernel.org>; Sat, 03 Nov 2012 03:44:22 -0700 (PDT)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, LMML <linux-media@vger.kernel.org>

I'm using the MFC on an S5PV210 to encode H264.

I'm interested in enabling cyclic intra refresh and fixed size slices.

I've set the controls 
V4L2_CID_MPEG_VIDEO_CYCLIC_INTRA_REFRESH_MB to 1
V4L2_CID_MPEG_VIDEO_MULTI_SLICE_MODE to
V4L2_MPEG_VIDEO_MULTI_SICE_MODE_MAX_BYTES
V4L2_CID_MPEG_VIDEO_MULTI_SLICE_MAX_BYTES to 20 * 1024

I've checked that these are making it to the driver, but they seem to
have no effect on the encode.

Are there any limitations, or other controls that need to be set to
enable these?

Cheers,
Mike
