From: =?UTF-8?Q?Krzysztof_Koz=C5=82owski?= <k.kozlowski.k@gmail.com>
Subject: Re: domain off
Date: Wed, 20 Jan 2016 22:30:53 +0900
Message-ID: <CAJKOXPdWA67DjrymJZY9cnTRuzaUFmLWyC+iBA9wHBVmiD_mBQ@mail.gmail.com>
References: <CAH9_wRPDMiCMNZJHkkK21oF8dySUfa5AUpGnp-nh6V77As6CPA@mail.gmail.com>
	<CAJKOXPe51YO3t1fhUdD1OsmXXcW3MoTwapvY4Y0q8QwaKrxzRg@mail.gmail.com>
	<CAH9_wRN13+PKLsTL3kSonLUpzHo7zbQJZ658C4+fRZRxe=HeTw@mail.gmail.com>
	<CAJKOXPeCyEYtUGf2skAbudOjGiSVn8Hyzk76B5aW8VJT7apoqA@mail.gmail.com>
	<CAH9_wRO28-4jMHwfVpwnDFbut6m=2gv_zVd3EnLguZj9EJYebA@mail.gmail.com>
	<569311BB.5040206@samsung.com>
	<CAH9_wRPnvosp4sq3fBHGhd7G=V69s7qQdg3mUF_d08aWS4H_ng@mail.gmail.com>
	<569F5D80.4040103@samsung.com>
	<CAH9_wRNxxifRBh6p77e3Pqh4QpbSmYrg6g+WOR2AjAX9EHG6ZA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ob0-f174.google.com ([209.85.214.174]:33018 "EHLO
	mail-ob0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751039AbcATNay (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 20 Jan 2016 08:30:54 -0500
Received: by mail-ob0-f174.google.com with SMTP id is5so6677929obc.0
        for <linux-samsung-soc@vger.kernel.org>; Wed, 20 Jan 2016 05:30:53 -0800 (PST)
In-Reply-To: <CAH9_wRNxxifRBh6p77e3Pqh4QpbSmYrg6g+WOR2AjAX9EHG6ZA@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Sriram V <vshrirama@gmail.com>
Cc: linux-samsung-soc@vger.kernel.org

2016-01-20 19:35 GMT+09:00 Sriram V <vshrirama@gmail.com>:
> Hi Krzysztof,
>
>
> Are you saying that only power domains under "Local Power Control" can
> be attached to runtime PM and can be turned off?
>
> In that case, i dont see other domains such as peris, psgen, wcore in
> there, Hence these need to be always on?
>
> is my understanding correct?

I don't know what kind of documentation you have. Judging by the
question above I think that you are asking me about interpretation of
datasheet... Really, your question is very strange... My Exynos5422
datasheet is quite specific on this topic.
Anyway you should ask for that to the vendor of the SoC - Samsung LSI.
It looks like you are looking for a support which should be given not
here, but by the vendor (because they sold you the SoC along with the
code).
Just to make it clear: I am not related anyhow to the Samsung LSI. I
am speaking only for myself.

As for the domains, you cannot independently control (under runtime
PM) all of the domains. Only some of them. Datasheet explicitly
describes what can be controlled. Other stuff is being turned off when
entering deeper sleep modes (like AFTR, SLEEP) - you can look for this
in cpuidle or suspend related code (open-source or vendor's).

Best regards,
Krzysztof
