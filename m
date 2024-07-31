Received: from fhigh8-smtp.messagingengine.com (fhigh8-smtp.messagingengine.com [103.168.172.159])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AAD5381A4
	for <linux-samsung-soc@vger.kernel.org>; Wed, 31 Jul 2024 17:57:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.159
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722448636; cv=none; b=qqDIU+gN0loVuROSAaeR3HU0nyJ5fDTpm4mW98Gfp/H5JI81RBhdExL4ucEFkzlkskowT7la9L0NVf8E5m76FEwkHdOb9gwv54t3DLoT7pwIif2aBqdqc7zgMsVPASYzbUrh827ilnCstksmIaDOJjpTeTW+zRe8tYLEdqU43uQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722448636; c=relaxed/simple;
	bh=vSCPvaer4rWQ1UBgyW1jMTJqLr4UMAnrs3thKEX6Wro=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=gh3vDyT7udW3axc8k7nifKJTjJiFEhOtjVL40ww5BGCcGsg0gegw9kJNk5ZdRwYVY+2DRh30F4uLkQ6qpH+ELQeBEjig9OiNO8YIJr3WaLrCs8+7cgNE1kjeDsYJZZXoUogs3RHGESMUlTtm8EEKSiubdlf7Q4e0eImQ4N/jSTY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=FALnvXDf; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=mMVPtsNa; arc=none smtp.client-ip=103.168.172.159
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="FALnvXDf";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="mMVPtsNa"
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailfhigh.nyi.internal (Postfix) with ESMTP id 1D6D81147257;
	Wed, 31 Jul 2024 13:57:14 -0400 (EDT)
Received: from imap51 ([10.202.2.101])
  by compute4.internal (MEProxy); Wed, 31 Jul 2024 13:57:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1722448634;
	 x=1722535034; bh=6+E3g9zljbVIYX9WNURbWHgefCN+EF1iNrL+yfKjfSk=; b=
	FALnvXDfjWj39c4t2+N3ljAlOb74QLlmR1eOdN29if2Ehh1hRrpw0m+UorAJEJto
	eXcmBByeVHwlGPfmpoFsDnGMJdOw/fYh1WUIEV7ndOvbO+kR1RFc3z8YOMdvDLuW
	aUTr9MsTB1FjAmXbMimybsnoE3NlrwDs3I4CE87lSgFlWSgemqfwL68652KFLsO1
	7uvjheZ2b3Ep3QQwuWCdoddc9DSYfFpBMR2u6sUUh7UdNKQeG8fVwrDNu8Mh6r5W
	GpkE0l1bj4CYH3XnUdLPyGYGg18hDqb9AMrrPhmT1jeN0MsA25c7KXD1CFYEiTF8
	xpcolpgw4uFwIsletrI0CQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1722448634; x=
	1722535034; bh=6+E3g9zljbVIYX9WNURbWHgefCN+EF1iNrL+yfKjfSk=; b=m
	MVPtsNa0N/q70IxkP4uD7GwNB0lwACfeA4aQDHyc24lJUBiDRQc0PbWRSzqJxFlP
	s/ilbP/osS0A6omD+fuYd9SWi2C1Sr3UP3AuqZEoL+MNjf3JIGwIkK2niLJ1AJLu
	4ykSbK1Tgx9+fdJI+nW8UwiqpsaTVmg00SaerYZvC46McXH1xzOUEgtKBf0OJnQp
	cX3BxOsvZkJSCUPM5dDKxIminaFhpGtSZtyP9MTxRlqVSQoH8PkZPIzcgA0CB9B6
	tN619ejckR1GV2Cv5DgIuyq0j5iygHgvz5Bhl6NP7Z892ncT5HH9UA0KZn+c/iRZ
	LeVdfEbw2zqmuQMXgrehg==
X-ME-Sender: <xms:-XqqZu87Jau5-WdKFnblRKgmhQly7SzuNLkf6P4GZvvoqUQ-w31ndg>
    <xme:-XqqZuta_RwiE8VgOz1E51SoQ7F_95V6plYKJAxLWc0NRBq9NE8VGc8WQsUn1dA3s
    76d8E-41rQzafUeHjQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrjeeigdduudelucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofggfffhvfevkfgjfhfutgfgsehtjeertdertddtnecuhfhrohhmpedftehr
    nhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrth
    htvghrnhepfefhheetffduvdfgieeghfejtedvkeetkeejfeekkeelffejteevvdeghffh
    iefhnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucevlhhushhtvghrufhiiigvpe
    dtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrrhhnugesrghrnhgusgdruggvpdhnsggp
    rhgtphhtthhopedt
X-ME-Proxy: <xmx:-nqqZkAwk4nMOTK0iLsmE4AAhXHNJzB6EawHgtOL-BkniR4exNMs8A>
    <xmx:-nqqZmd36BBh1pTYb-iF-dIWCx9Fk8mvX3uZaWKo4drnTF474qsXZA>
    <xmx:-nqqZjMlea_EFE9VvlvGF7xkFBqwjLDYP0NO73sHshn8ctK2piDK2g>
    <xmx:-nqqZglF65NKUB3QIvEj61qK8AZ44LNYpYVk3rUEa9seTgc9dgXNTA>
    <xmx:-nqqZsriKaizY0NNvHlsc_Q21CgzXsxRvRhJyJSKf76XoAarNmC2pWv6>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id D393EB6008D; Wed, 31 Jul 2024 13:57:13 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Wed, 31 Jul 2024 19:56:51 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Dmitry Torokhov" <dmitry.torokhov@gmail.com>,
 "Mark Brown" <broonie@kernel.org>
Cc: linux-samsung-soc@vger.kernel.org, "Krzysztof Kozlowski" <krzk@kernel.org>
Message-Id: <df0a82f6-a6a2-4d4f-b91b-acea7921bfed@app.fastmail.com>
In-Reply-To: <ZqpzAB2x1-C7V4AS@google.com>
References: <ZqmkfEijDcE--F0L@google.com>
 <f71e9bfd-2407-4f16-a94c-d80715777b1b@app.fastmail.com>
 <3aa5c9d9-2b19-4797-964d-97e2dd325f3e@sirena.org.uk>
 <ZqpzAB2x1-C7V4AS@google.com>
Subject: Re: mach-crag6410.c staying or going?
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Wed, Jul 31, 2024, at 19:23, Dmitry Torokhov wrote:
> On Wed, Jul 31, 2024 at 01:10:25PM +0100, Mark Brown wrote:
>> On Wed, Jul 31, 2024 at 02:06:00PM +0200, Arnd Bergmann wrote:
>> > On Wed, Jul 31, 2024, at 04:42, Dmitry Torokhov wrote:
>> 
>> > > I would like to remove platform data suppirt from samsung-keypad driver;
>> > > mach-crag6410.c is the only user of samsung_keypad_platdata structure.
>> 
>> > Unfortunately we are a bit stuck here and there is no good answer
>> > for it. I think this board file is holding up more cleanups than
>> > any other and I'd love to get rid of it, but Mark is still using
>> > the machine, and probably relies on it more than anyone else
>> > needs the other board files.
>> 
>> While I am using the device I don't care at all about the keypad driver,
>> I don't use the keypad at all so that could just be removed as far as
>> I'm concerned.
>
> Nah, if it is still used I can convert properly, especially if you can
> try my patches.
>
> Should the warning about removal after '24 be removed then?

As promised, I have now sent my email about the wider board
deprecation timeline, see

https://lore.kernel.org/linux-arm-kernel/2831c5a6-cfbf-4fe0-b51c-0396e5b0aeb7@app.fastmail.com/T/#u

Let's see if we can agree on a plan for removing more of the
other boards first, and then add consistent warnings to the
ones that are on the way out.

     arnd
