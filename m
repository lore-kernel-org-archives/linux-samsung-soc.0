From: Mauro Carvalho Chehab <maurochehab@gmail.com>
Subject: Re: [PATCH/RFC v2.1 0/2] Mem-to-mem device framework
Date: Wed, 03 Feb 2010 06:44:28 -0200
Message-ID: <4B69376C.1010407@gmail.com>
References: <1261574255-23386-1-git-send-email-p.osciak@samsung.com>
	<200912231605.44181.hverkuil@xs4all.nl>
	<000001ca87cc$f599dca0$e0cd95e0$%osciak@samsung.com>
	<19F8576C6E063C45BE387C64729E7394044A277BB2@dbde02.ent.ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <19F8576C6E063C45BE387C64729E7394044A277BB2@dbde02.ent.ti.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
	<mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
	<mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: linux-arm-kernel-bounces@lists.infradead.org
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: "Hiremath, Vaibhav" <hvaibhav@ti.com>
Cc: "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, 'Xiaolin Zhang' <xiaolin.zhang@intel.com>, 'Guru Raj' <gururaj.nagendra@intel.com>, Pawel Osciak <p.osciak@samsung.com>, 'Magnus Damm' <magnus.damm@gmail.com>, 'Hans Verkuil' <hverkuil@xs4all.nl>, "kyungmin.park@samsung.com" <kyungmin.park@samsung.com>, "Karicheri, Muralidharan" <m-karicheri2@ti.com>, 'Sakari Ailus' <sakari.ailus@maxwell.research.nokia.com>, "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Marek Szyprowski <m.szyprowski@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

Hiremath, Vaibhav wrote:
>> -----Original Message-----
>> From: Pawel Osciak [mailto:p.osciak@samsung.com]
>> Sent: Monday, December 28, 2009 8:19 PM
>> To: 'Hans Verkuil'
>> Cc: linux-media@vger.kernel.org; linux-samsung-soc@vger.kernel.org;
>> linux-arm-kernel@lists.infradead.org; Marek Szyprowski;
>> kyungmin.park@samsung.com; Hiremath, Vaibhav; Karicheri,
>> Muralidharan; 'Guru Raj'; 'Xiaolin Zhang'; 'Magnus Damm'; 'Sakari
>> Ailus'
>> Subject: RE: [PATCH/RFC v2.1 0/2] Mem-to-mem device framework
>>
>> Hello Hans,
>>
>>
>> On Wednesday 23 December 2009 16:06:18 Hans Verkuil wrote:
>>> Thank you for working on this! It's much appreciated. Now I've
>> noticed that
>>> patches regarding memory-to-memory and memory pool tend to get
>> very few comments.
>>> I suspect that the main reason is that these are SoC-specific
>> features that do
>>> not occur in consumer-type products. So most v4l developers do not
>> have the
>>> interest and motivation (and time!) to look into this.
>> Thank you very much for your response. We were a bit surprised with
>> the lack of
>> responses as there seemed to be a good number of people interested
>> in this area.
>>
>> I'm hoping that everybody interested would take a look at the test
>> device posted
>> along with the patches. It's virtual, no specific hardware required,
>> but it
>> demonstrates the concepts behind the framework, including
>> transactions.
>>
> [Hiremath, Vaibhav] I was on vacation and resumed today itself, I will go through these patch series this weekend and will get back to you.
> 
> I just had cursory look and I would say it should be really good starting point for us to support mem-to-mem devices.\

Hmm... it seems to me that those patches are still under discussion/analysis.
I'll mark them as RFC at the Patchwork.

Please let me know after you, SoC guys, go into a consensus about it. Then,
please submit me the final version.

Cheers,
Mauro
