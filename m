From: Grant Likely <grant.likely@secretlab.ca>
Subject: Re: [PATCH v7 2/3] of/pci: Provide support for parsing PCI DT ranges
 property
Date: Thu, 18 Apr 2013 16:29:54 +0100
Message-ID: <CACxGe6u7yoecyTR2r-EzpcRxLuSw-p9KC7jA12wEQZs4of3vFA@mail.gmail.com>
References: <1366107508-12672-1-git-send-email-Andrew.Murray@arm.com>
 <1366107508-12672-3-git-send-email-Andrew.Murray@arm.com>
 <20130418134401.84AEE3E1319@localhost>
 <20130418142434.GA18881@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20130418142434.GA18881@arm.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Andrew Murray <andrew.murray@arm.com>
Cc: "linux-mips@linux-mips.org" <linux-mips@linux-mips.org>, "siva.kallam@samsung.com" <siva.kallam@samsung.com>, "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>, "linus.walleij@linaro.org" <linus.walleij@linaro.org>, "thierry.reding@avionic-design.de" <thierry.reding@avionic-design.de>, Liviu Dudau <Liviu.Dudau@arm.com>, "paulus@samba.org" <paulus@samba.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, "linux@arm.linux.org.uk" <linux@arm.linux.org.uk>, "jg1.han@samsung.com" <jg1.han@samsung.com>, "jgunthorpe@obsidianresearch.com" <jgunthorpe@obsidianresearch.com>, "thomas.abraham@linaro.org" <thomas.abraham@linaro.org>, "benh@kernel.crashing.org" <benh@kernel.crashing.org>, "arnd@arndb.de" <arnd@arndb.de>, "devicetree-discuss@lists.ozlabs.org" <devicetree-discuss@lists.ozlabs.org>, "rob.herring@calxeda.com" <rob.herring@calxeda.com>
List-Id: linux-samsung-soc@vger.kernel.org

On Thu, Apr 18, 2013 at 3:24 PM, Andrew Murray <andrew.murray@arm.com> wrote:
> On Thu, Apr 18, 2013 at 02:44:01PM +0100, Grant Likely wrote:
>> On Tue, 16 Apr 2013 11:18:27 +0100, Andrew Murray <Andrew.Murray@arm.com> wrote:
>> >             /* Act based on address space type */
>> >             res = NULL;
>> > -           switch ((pci_space >> 24) & 0x3) {
>> > -           case 1:         /* PCI IO space */
>> > +           res_type = range.flags & IORESOURCE_TYPE_BITS;
>> > +           if (res_type == IORESOURCE_IO) {
>>
>> Why the change from switch() to an if/else if sequence?
>
> Russell King suggested this change - see
> https://patchwork.kernel.org/patch/2323941/

Umm, that isn't what that link shows. That link shows the patch
already changing to an if/else if construct, and rmk is commenting on
that.

g.
