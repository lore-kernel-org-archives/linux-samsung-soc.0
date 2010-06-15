From: Vladimir Davydov <vladimir.davydov@promwad.com>
Subject: s3c-otg host driver status
Date: Tue, 15 Jun 2010 16:23:01 +0300
Message-ID: <201006151623.01687.vladimir.davydov@promwad.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from promwad.com ([83.149.69.23]:49445 "EHLO promwad.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753108Ab0FON5V convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 15 Jun 2010 09:57:21 -0400
Received: from [195.222.85.229] (helo=intranet.promwad.com)
	by promwad.com with esmtps (TLSv1:AES256-SHA:256)
	(Exim 4.63)
	(envelope-from <vladimir.davydov@promwad.com>)
	id 1OOW6K-0005eU-EN
	for linux-samsung-soc@vger.kernel.org; Tue, 15 Jun 2010 16:22:48 +0300
Received: from [178.124.78.112] (helo=linux-x8hi.localnet)
	by intranet.promwad.com with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69)
	(envelope-from <vladimir.davydov@promwad.com>)
	id 1OOW5j-0008Bo-Vr
	for linux-samsung-soc@vger.kernel.org; Tue, 15 Jun 2010 16:22:12 +0300
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org

Hi All,

Can anybody explain current status of the S3C OTGHCD driver? Does it ha=
ve any=20
progress? I have found that the current version of the driver doesn't w=
ork=20
correctly with USB mice and keyboards (deadlocks). Also, external USB h=
ub=20
doesn't work.
I have tested on the S3C6410.

Best regards,
Vladimir

--=20
Vladimir Davydov
Senior Developer
Promwad Innovation Company
Web: www.promwad.com
22, Olshevskogo St.,
220073, Minsk,
BELARUS
Phone/Fax: +375 (17) 312=E2=80=931246
E-mail: vladimir.davydov@promwad.com
Skype: v_davydov
