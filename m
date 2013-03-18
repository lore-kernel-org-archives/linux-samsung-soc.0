From: Stephen Warren <swarren@wwwdotorg.org>
Subject: Re: [PATCH] ARM: dts: add interrupt-names property to get interrupt
 resource by name
Date: Mon, 18 Mar 2013 12:11:15 -0600
Message-ID: <514758C3.7070601@wwwdotorg.org>
References: <1363173980-11428-1-git-send-email-vikas.sajjan@linaro.org> <51408FB9.90808@gmail.com> <514100D9.1000603@gmail.com> <514737D4.8080601@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from avon.wwwdotorg.org ([70.85.31.133]:38187 "EHLO
	avon.wwwdotorg.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752174Ab3CRSLU (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 18 Mar 2013 14:11:20 -0400
In-Reply-To: <514737D4.8080601@gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Rob Herring <robherring2@gmail.com>
Cc: Sylwester Nawrocki <sylvester.nawrocki@gmail.com>, linux-samsung-soc@vger.kernel.org, l.krishna@samsung.com, devicetree-discuss@lists.ozlabs.org, joshi@samsung.com, inki.dae@samsung.com, kgene.kim@samsung.com, Vikas Sajjan <vikas.sajjan@linaro.org>, linaro-kernel@lists.linaro.org

On 03/18/2013 09:50 AM, Rob Herring wrote:
> On 03/13/2013 05:42 PM, Sylwester Nawrocki wrote:
>> Rob,
>>
>> On 03/13/2013 03:39 PM, Rob Herring wrote:
>>> I fail to see what the hack is. The order of interrupt properties must
>>> be defined by the binding. interrupt-names is auxiliary data and must
>>> not be required by an OS.

Is that true for all foo-names properties, or only for interrupt-names?
I was under the impression that foo-names was specifically invented so
that the order of the entries didn't matter, and instead they could be
requested by name.
