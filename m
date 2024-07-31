Received: from fout7-smtp.messagingengine.com (fout7-smtp.messagingengine.com [103.168.172.150])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 284431AD9F4
	for <linux-samsung-soc@vger.kernel.org>; Wed, 31 Jul 2024 12:06:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.150
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722427584; cv=none; b=EmuKYrQ6YsH7UL9O8AaWNEXZf6MuQkV30pT1JtJDm44pRu6kOCYj3M/UUcKTB7ujzZTcT4SARVMqVSTT7kXFh6qrg12m4W/OWZgTyZiGoyYbPnyPERmZLnF+rm0iOFRHYc12Qfyb9LdqoOUc4Z/CFn58/Q6SylttJKujZ28EO5o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722427584; c=relaxed/simple;
	bh=0uq1G/cjCRaZjIn5tWwhKPGY8z4osBqZcWzNE9RNyAY=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=rLHkS6QzOm1YNv1pj2RYs4hoJ3faUFaoURxl+ZfeJvQ8dODbexTgMcQTZnxBI5uf/F1Rc854h7pN/1rv9wv6OGNh112b1jYt49zyfVdfTFkYdG3BKFTgXOaPKdOPSYKaea1OduuOJSxHu84tiv3ssRiQJU3GYJhpji7i8mGiVuE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=q1EHP79D; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=To0VU9JX; arc=none smtp.client-ip=103.168.172.150
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="q1EHP79D";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="To0VU9JX"
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailfout.nyi.internal (Postfix) with ESMTP id 0230913821BB;
	Wed, 31 Jul 2024 08:06:21 -0400 (EDT)
Received: from imap51 ([10.202.2.101])
  by compute4.internal (MEProxy); Wed, 31 Jul 2024 08:06:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1722427580;
	 x=1722513980; bh=+E1VH7sb9kJAPf9OXOHTYim6q7T8pLq5k9a/KEVO/fQ=; b=
	q1EHP79DIkm5inEIXUHtpGcYeAEnan4r5RATI9TctmcsCIBIWJr9YCn3agP9CDEP
	uGH3OKrZjEEH1ZJ6N59zG3X36/O7s658RlSvueDvH/iw7pVJJPWaQxyLntl3XZ/d
	KlTnc6lg5IUxj+u6PBXWJJmbvHl4w0tqQ2DaxzPc6GaNlRUyp3CpT4HWNQcVx5Jy
	OBkwV+x8Y17RBM0kTGgmMGiuB3IX9qsX4BpD1jp4fFtznBXF8osgHWtniQ4QbPxB
	8Rf6/0izd9P7hcfE6+0BiQNNDmSm3OLXE+vUFZGV2OMRpeTmffdYFPDGAP/B3g1N
	tSeVNASSsNFE4F8jxrk0WA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1722427580; x=
	1722513980; bh=+E1VH7sb9kJAPf9OXOHTYim6q7T8pLq5k9a/KEVO/fQ=; b=T
	o0VU9JXyaK3ehpJXGCxZRbdv0Mnllhrm1ta+/pGz/n0gRevl9wRJt+Wm6HV1RaE7
	HuLTDVfM+nxHUT25xYvwkqKYHdZjeoVcM2HSWvbH5ZtuwMbTsk5Hd8WDVexF4SEX
	zOHSTk1vAXtBqNEPmcVmq3334KeQzgCHs75gf9nqeOa23K1bQuCVoX4QCUcpwLKH
	l9ySrtu6je4SEZWBUrZPSFDBS38wj/Ii3kkdlBjw7sSGkhYY58C/dWEV2vZ0QGmG
	2BwgCz9YM4KqyHl5spu94Oyc6a+h8R2U0LE84UGuRH2bMFcjWnR9oDg3E8LJlDHg
	Sx8FGdGyMPjb6nClAj0Eg==
X-ME-Sender: <xms:vCiqZjR2Ea_oARthX04jOW7-g3n8kUKcilfGktnz84bM-teC6PCxEQ>
    <xme:vCiqZkwoiJKZ1vDR_U1mT3eSBSo1n89sZlo9rxAfjQUP_0-uvUhu3_VbcUdtGqf7P
    e49aYERlfBXI09yy2c>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrjeeigdeglecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefoggffhffvvefkjghfufgtgfesthejredtredttdenucfhrhhomhepfdetrhhn
    ugcuuegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdruggvqeenucggtffrrghtth
    gvrhhnpefhtdfhvddtfeehudekteeggffghfejgeegteefgffgvedugeduveelvdekhfdv
    ieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrrh
    hnugesrghrnhgusgdruggvpdhnsggprhgtphhtthhopedt
X-ME-Proxy: <xmx:vCiqZo3Inb2FRqyVq3V1xB8uidVOEMuVe-uSnHaBCdRORDt_VUa-HA>
    <xmx:vCiqZjB-POttb4yfd2qHBtRi2VdXy-02-Ogi8s8UxaX13MKiMt1s8Q>
    <xmx:vCiqZsiepLJ3kLds8D2pQo-7lMu-pJknL7arxlqeeohHTHqao84YJg>
    <xmx:vCiqZnrnBUjXsjp7vcgQIU02KMYqBtzoLVUN3F7C5x8MKmcJZzMRrQ>
    <xmx:vCiqZlsC0hO0jlvAajV4xoGXGnzBsrBeEV1snB_zQD2H1-Ww825Quhb5>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id B888CB6008D; Wed, 31 Jul 2024 08:06:20 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Wed, 31 Jul 2024 14:06:00 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Dmitry Torokhov" <dmitry.torokhov@gmail.com>,
 linux-samsung-soc@vger.kernel.org
Cc: "Krzysztof Kozlowski" <krzk@kernel.org>, "Mark Brown" <broonie@kernel.org>
Message-Id: <f71e9bfd-2407-4f16-a94c-d80715777b1b@app.fastmail.com>
In-Reply-To: <ZqmkfEijDcE--F0L@google.com>
References: <ZqmkfEijDcE--F0L@google.com>
Subject: Re: mach-crag6410.c staying or going?
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Wed, Jul 31, 2024, at 04:42, Dmitry Torokhov wrote:
> Hi,
>
> I would like to remove platform data suppirt from samsung-keypad driver;
> mach-crag6410.c is the only user of samsung_keypad_platdata structure.
>
> I started converting it to software nodes, but I noticed the following
> message:
>
> ../arch/arm/mach-s3c/s3c64xx.c:423:9: note: '#pragma message: The
> platform is deprecated and scheduled for removal. Please reach to the
> maintainers of the platform and linux-samsung-soc@vger.kernel.org if you
> still use it.Without such feedback, the platform will be removed after
> 2024.'
>
> So is this board/platform being dropped? If so when?

Unfortunately we are a bit stuck here and there is no good answer
for it. I think this board file is holding up more cleanups than
any other and I'd love to get rid of it, but Mark is still using
the machine, and probably relies on it more than anyone else
needs the other board files.

My personal impression is that yes, we will drop the board, just
not at the current timeline but following a later LTS kernel (
early 2026 or early 2027).

I have a list of all the other board file categories and how
long I expect them to be needed for, and should send that out
for further discussion now that rc1 is out.

My best estimate is that we can try to drop about 30 of the
remaining 40 board files in linux-6.13, and then keep chipping
away at the rest in the following years.

     Arnd
