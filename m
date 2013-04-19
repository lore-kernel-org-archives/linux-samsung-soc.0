From: Gabor Juhos <juhosg@openwrt.org>
Subject: Re: [PATCH v7 3/3] of/pci: mips: convert to common of_pci_range_parser
Date: Fri, 19 Apr 2013 09:19:50 +0200
Message-ID: <5170F016.6050502@openwrt.org>
References: <1366107508-12672-1-git-send-email-Andrew.Murray@arm.com>
 <1366107508-12672-4-git-send-email-Andrew.Murray@arm.com>
 <CACRpkdbBaT1OKr5t8HW4+8y_wSDmGxmewAyVMekx8S-K9s3K8Q@mail.gmail.com>
 <20130418125910.GA17128@arm.com>
 <20130418130919.GI27197@titan.lakedaemon.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20130418130919.GI27197@titan.lakedaemon.net>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Jason Cooper <jason@lakedaemon.net>
Cc: "linux-mips@linux-mips.org" <linux-mips@linux-mips.org>, "siva.kallam@samsung.com" <siva.kallam@samsung.com>, "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>, Linus Walleij <linus.walleij@linaro.org>, Thierry Reding <thierry.reding@avionic-design.de>, Liviu Dudau <Liviu.Dudau@arm.com>, Grant Likely <grant.likely@secretlab.ca>, Paul Mackerras <paulus@samba.org>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Russell King - ARM Linux <linux@arm.linux.org.uk>, Jingoo Han <jg1.han@samsung.com>, Jason Gunthorpe <jgunthorpe@obsidianresearch.com>, Thomas Abraham <thomas.abraham@linaro.org>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Arnd Bergmann <arnd@arndb.de>, "devicetree-discuss@lists.ozlabs.org" <devicetree-discuss@lists.ozlabs.org>, "rob.herring@calxeda.com" <rob.herring@calxeda.com>, Kukjin Kim <kgene.kim@samsung.com>"bhelgaas@google.com" <b>
List-Id: linux-samsung-soc@vger.kernel.org

2013.04.18. 15:09 keltez=E9ssel, Jason Cooper =EDrta:
> On Thu, Apr 18, 2013 at 01:59:10PM +0100, Andrew Murray wrote:
>> On Wed, Apr 17, 2013 at 04:42:48PM +0100, Linus Walleij wrote:
>>> On Tue, Apr 16, 2013 at 12:18 PM, Andrew Murray <Andrew.Murray@arm.com>=
 wrote:
>>>
>>>> This patch converts the pci_load_of_ranges function to use the new com=
mon
>>>> of_pci_range_parser.
>>>>
>>>> Signed-off-by: Andrew Murray <Andrew.Murray@arm.com>
>>>> Signed-off-by: Liviu Dudau <Liviu.Dudau@arm.com>
>>>> Reviewed-by: Rob Herring <rob.herring@calxeda.com>
>>>
>>> Tested-by: Linus Walleij <linus.walleij@linaro.org>
>>
>> Jason - you may not have seen this, but here (Linus Walleij) is another =
Tested-by
>> to add to this patch in your tree (if you can).
> =

> Thanks, I saw it.  Unfortunately, the PR was already sent, and the branch
> is now pulled into arm-soc.

Sorry I had no time earlier, but I have tested this now on MIPS. The patch
causes build errors unfortunately. Given the fact that this has been merged
already, I will send a fixup patch.

-Gabor
