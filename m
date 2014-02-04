From: Daniel Drake <drake@endlessm.com>
Subject: s5p-mfc firmware load path
Date: Tue, 4 Feb 2014 14:03:05 -0600
Message-ID: <CAD8Lp46MixW50ioLKtbrNcLPtqHzq2wGCGT0KYjPm+KMXhA=jA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ob0-f177.google.com ([209.85.214.177]:36106 "EHLO
	mail-ob0-f177.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752828AbaBDUDH (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 4 Feb 2014 15:03:07 -0500
Received: by mail-ob0-f177.google.com with SMTP id wp18so10001293obc.22
        for <linux-samsung-soc@vger.kernel.org>; Tue, 04 Feb 2014 12:03:05 -0800 (PST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc <linux-samsung-soc@vger.kernel.org>

Hi,

linux-firmware git layout suggests that s5p-mfc firmware should be
installed to /lib/firmware/s5p-mfc and this is where distros seem to
be installing it.

However, the request_firmware calls in the s5p-mfc driver cause the
kernel to look for the firmware at /lib/firmware directly, and fail to
find it under such configurations.

Which is the correct fix for this inconsistency?

Thanks,
Daniel
