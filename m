From: Joonyoung Shim <jy0922.shim@samsung.com>
Subject: Re: [PATCH v2 1/5] ARM: SAMSUNG: Add keypad device support
Date: Mon, 31 May 2010 10:14:02 +0900
Message-ID: <4C030D5A.1060609@samsung.com>
References: <1275188784-23395-1-git-send-email-jy0922.shim@samsung.com>
 <201005300542.37715.marek.vasut@gmail.com>
 <20100530085224.GA28188@core.coreip.homeip.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:56505 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754801Ab0EaBOG (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 30 May 2010 21:14:06 -0400
In-reply-to: <20100530085224.GA28188@core.coreip.homeip.net>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Marek Vasut <marek.vasut@gmail.com>, ben-linux@fluff.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-input@vger.kernel.org, kyungmin.park@samsung.com

On 5/30/2010 5:52 PM, Dmitry Torokhov wrote:
> On Sun, May 30, 2010 at 05:42:37AM +0200, Marek Vasut wrote:
>> Dne Ne 30. kv=ED=9C=8Etna 2010 05:06:20 Joonyoung Shim napsal(a):
>>> + */
>>> +struct samsung_kp_platdata {
>>> +	const struct matrix_keymap_data	*keymap_data;
>>> +	unsigned int		rows;
>>> +	unsigned int		cols;
>>> +	unsigned int		rep;
>> I don't know, maybe using uint32_t here? On ARM, it doesn't matter s=
o far as int=20
>> will be always 32bit, but maybe we should just type the variables we=
ll ?
>>
>> Guys, what do you think ?
>>
>=20
> I think unsigned int is fine, we do not care about particular size, j=
ust
> need "big enough". I'd change 'rep' to be a boolean though.
>=20

I will modify 'rep' to unsinged int rep:1;
